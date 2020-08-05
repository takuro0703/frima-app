class CardsController < ApplicationController
  require "payjp"
  def new
  end
  
  def index
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp, :PAYJP_PRIVATE_KEY]
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      amount: @item.item_price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
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
      @card = Card.new(user_id: current_user.id, customer_id: customer.id)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "create"
      end
    end
  end
  
 
end
