class ItemsController < ApplicationController
  def index
    @items = Item.all
    @images = Image.all
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    
     @item = Item.new(item_params)
     binding.pry
   if @item.save
     redirect_to root_path
   else
    render :new
   end
  end

  private
  def item_params
   
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :brand_description, :fee_id, :prefecture_id, :span_id, :item_price, images_attributes: [:image]).merge(user_id: current_user.id, sold_status: "販売中")

end
end
