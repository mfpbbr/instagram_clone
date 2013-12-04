class ChargesController < ApplicationController

  def new
    @photo_id = params[:photo_id]
  end

  def index
  	redirect_to photos_path
  end

  def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => current_user.id,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'GBP'
  )
  photo_id = params[:photo_id]
  ChargeMailer.new_charge_notification(charge, photo_id).deliver!
  redirect_to photos_path

  rescue Stripe::CardError => e
  	flash[:error] = e.message

  	redirect_to photos_path
  end

end
