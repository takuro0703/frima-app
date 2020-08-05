class ItemsController < ApplicationController
  before_action :set_item,only: [:show, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

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
   likes = @item.likes.map{|like| like.user_id}


     @category = Category.new
  end

  def search
    @items = Item.search(params[:keyword])
    sort = params[:sort] || "created_at DESC"
    # 入力された値をLIKE句により各カラムと一致したものを抽出する。
    @items = Item.where('name LIKE(?) OR description LIKE(?)', "%#{@keyword}%", "%#{@keyword}%").order(sort)
    # @count = @items.count
    # 検索結果が"0"だった場合、全ての商品を表示させる
    if @count == 0
      @iems = Item.order(sort)

    
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
end

