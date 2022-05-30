class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    # binding.pry
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :area_id, :building, :municipality, :address, :phone).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_2c8f99642adb8bfd94a7fdde"
    Payjp::Charge.create(
    amount: @item.price,
    card: purchase_address_params[:token],
    currency: 'jpy'
    )
  end


end
