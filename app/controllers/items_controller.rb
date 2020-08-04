class ItemsController < ApplicationController
  before_action :set_item,only: [:show, :edit, :update, :destroy]
  before_action :show_all_instance, only: [:show, :edit, :update, :destroy]


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
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    likes = @item.likes.map{|like| like.user_id == current_user.id}


    @category = Category.new
  end

  def edit
  end

  def update
    if edit_item_params[:images_attributes].nil?
      render :edit
    else
      exit_ids = []
      edit_item_params[:images_attributes].each do |a,b|
        exit_ids << edit_item_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(item_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      Image.where(id:delete__db).destroy_all
      @item.touch
      if @item.update(edit_item_params)
        redirect_to  root_path
      else
        render :edit
      end
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :brand_description, :fee_id, :prefecture_id, :span_id, :item_price, images_attributes: [:image]).merge(user_id: current_user.id, sold_status: "販売中")
  end

  def edit_item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :brand_description, :fee_id, :prefecture_id, :span_id, :item_price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id, sold_status: "販売中")
  end

  def show_all_instance
    @user = User.find(@item.user_id)
    @images = Image.where(item_id: params[:id])
    @images_first = Image.where(item_id: params[:id]).first
    @category_id = @item.category_id
  end
end

