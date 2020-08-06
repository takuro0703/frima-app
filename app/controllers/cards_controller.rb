class CardsController < ApplicationController
  require "payjp"
  before_action :set_card
  def new
  end
  
  def index
    @card = Card.find_by(user_id: current_user.id)
    @item = Item.find(params[:item_id])
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    Payjp::Charge.create(
      amount: @item.item_price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
    @item_buyer= Item.find(params[:item_id])
    @item_buyer.update( buyer_id: current_user.id)
    @item_buyer.update( sold_status: "売り切れ")
    redirect_to root_path
  end
 
  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "create"
      end
    end
  end

  def show
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: 'new'
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
      @exp_month = @customer_card.exp_month.to_s
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def destroy
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: 'new'
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      if @card.destroy
        redirect_to root_path
      else
        redirect_to card_path(current_user.id), alert:"削除出来ませんでした"
      end
    end
  end

  private
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end
