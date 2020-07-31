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

     @item = Item.new(other_item_params[:item][[:item_name], [:ite_description], [:category_id], [:status], [:brand_description], [:span], [:item_price]])
     @image = @item.images.new(item_params[:item][:images_attributes])
     redirect_to root_path
     binding.pry
  end
  private
  def item_image_params
    params.require(:item).permit(image_attributes: [:image_content])
end

  def other_item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status, :brand_description, :fee, :prefecture, :span, :item_price)
end
end