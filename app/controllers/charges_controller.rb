class ChargesController < ApplicationController

  def new

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

  @charge = charge

  ChargeMailer.new_charge_notification(@charge).deliver

  redirect_to photos_path


  rescue Stripe::CardError => e
  	flash[:error] = e.message

  	redirect_to photos_path
  end

end
