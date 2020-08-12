class ItemsController < ApplicationController
  before_action :set_item,only: [:show, :edit, :update, :destroy]
  before_action :show_all_instance, only: [:show, :edit, :update, :destroy]

  def index
      @items = Item.where(sold_status: "販売中")
      @images = Image.all
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    
   if item_params[:category_id] == nil
      render :new 
   else
      @item = Item.new(item_params)
     if @item.save
      redirect_to root_path
     else
      render :new
     end
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)


    likes = @item.likes.map{|like| like.user_id}

    @category = Category.new
  end

  def edit
   
    @item.images.build
  end

  def update
   
      if @item.update(edit_item_params)
        redirect_to  root_path
      else
        render :edit
      # end
    end
  end

  def search
    @items = Item.search(params[:content])

    
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def get_category_parent
    @category_parent = Category.where(ancestry: nil)
    
  end

  def get_category_children
    @category_children = Category.find(params[:data_id]).children
  end

  def get_category_grandchildren
    
    @category_grandchildren = Category.find(params[:data_id]).children
  end 

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end



  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :brand_description, :fee_id, :prefecture_id, :span_id, :item_price, images_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id, sold_status: "販売中")
  end

  def edit_item_params
    params.require(:item).permit(:item_name, :item_description, 
    :category_id, :status_id, :brand_description, :fee_id, 
    :prefecture_id, :span_id, :item_price, 
    images_attributes: [:image, :id, :_destroy])
    .merge(user_id: current_user.id, sold_status: "販売中")
  
  end

  def show_all_instance
    @user = @item.user
    @images = @item.images
    @images_first = @images.first
    @category_id = @item.category_id
  end
end

