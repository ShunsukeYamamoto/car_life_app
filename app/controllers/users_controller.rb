class UsersController < ApplicationController
  before_action :move_to_user_sign_in

  def index
    if current_user.admin?
      @sales_events = Event.where(sales_id: current_user.id)
      @event = @sales_events.first
      @customer = @event.customer
      @events = Event.where(customer_id: @event.customer.id)
      @messages = @event.messages.order(created_at: 'ASC')
      @message = Message.new
      @car = Car.new
    elsif 
      @customer_events = Event.where(customer_id: current_user.id).order(date: "ASC")
      @cars = current_user.cars.order(created_at: 'ASC')
      @messages = @customer_events.first.messages.order(created_at: 'DESC')
      @event = @customer_events.first
      @message = Message.new
    end
  end

  private

  def move_to_user_sign_in
    redirect_to user_session_path unless user_signed_in?
  end
end
