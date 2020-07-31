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
    binding.pry
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :ite_description, :category_id, :status, :brand_description, :fee, :prefecture, :span, :item_price, image_attributes: [:image])
end
end