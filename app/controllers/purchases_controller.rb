class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      redirect_to item_purchases_path
    end
  end

  private

  def purchase_address_params
    params.permit(:post_code, :area_id, :building, :municipality, :address, :phone).merge(token: params[:token])
  end
end
