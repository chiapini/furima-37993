class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_adress = PurchaseAdress.new (purchase_adress_params)
    if  @purchase_adress.valid?
      @purchase_adress.save
      redirect_to root_path     
   else
     render :new
  end
end

  private
  def purchase_adress_params
    params.require(:PurchaseAdress).permit(:post_code,:area_id,:building,:municipality,:adress,:phone).merge
  end
end
