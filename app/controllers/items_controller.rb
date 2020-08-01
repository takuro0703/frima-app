class ItemsController < ApplicationController
  def index
    @items = Item.all
    @images = Image.all
  end

  def new
    @item = Item.new
<<<<<<< Updated upstream
    @item.images.new
  end

  def create
    
     @item = Item.new(item_params)
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
=======
    @image = Image.new
  end

  def create
    
    redirect_to root_path
  end

  private
  def sell_item_params
    params.require(:item).permit(:item_name, :item_description, :status, :brand_description, :fee, :prefecture, :span, :item_price)
  end
 end
>>>>>>> Stashed changes
