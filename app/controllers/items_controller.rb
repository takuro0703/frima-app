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
   
    params.require(:item).permit(:item_name, :item_description, :category_id, :status, :brand_description, :fee, :prefecture, :span, :item_price, images_attributes: [:image])
    binding.pry

end
end