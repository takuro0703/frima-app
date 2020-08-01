class ItemsController < ApplicationController
  before_action :set_item,only: [:show]

  def index
    @items = Item.all
    @images = Image.all
  end

  def show
    # binding.pry
   likes = @item.likes.map{|like| like.user_id == current_user.id}
   
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end