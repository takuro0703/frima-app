class ItemsController < ApplicationController
  before_action :set_item,only: [:show, :destroy]

  def index
    @items = Item.all
    @images = Image.all
  end

  

end