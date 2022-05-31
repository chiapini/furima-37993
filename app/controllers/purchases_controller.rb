class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :redirect_to_root_path, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def redirect_to_root_path
    redirect_to root_path if @item.purchase.present?
  end

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :area_id, :building, :municipality, :address, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
