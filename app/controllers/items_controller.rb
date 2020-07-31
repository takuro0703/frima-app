class ItemsController < ApplicationController
  def index
    @items = Item.all
    @images = Image.all
  end

  def new
    @item = Item.new
    @image = Image.new
  end

  def create
  end
end