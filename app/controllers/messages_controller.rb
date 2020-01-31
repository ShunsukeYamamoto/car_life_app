class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to event_messages_path(message.event.id)
  end

  def index
    if current_user.admin?
      @sales_events = Event.where(sales_id: current_user.id).order(date: "ASC")
      @event = Event.find(params[:event_id])
      @messages = @event.messages.order(created_at: 'ASC')
      @message = Message.new
      @customer = @event.customer
      @events = Event.where(customer_id: customer.id)
      @car = Car.new
    elsif 
      @customer_events = Event.where(customer_id: current_user.id).order(date: "ASC")
      @cars = current_user.cars.order(created_at: 'ASC')
      @event = Event.find(params[:event_id])
      @messages = @event.messages.order(created_at: 'ASC')
      @message = Message.new
    end
  end

  private

  def message_params
    event = Event.find(params[:event_id])
    sales = event.sales
    customer = event.customer
    car = event.car
    params.require(:message).permit(:text,:image).merge(customer_id: customer.id,sales_id: sales.id,car_id: car.id,event_id: event.id,talker_id:current_user.id)
  end
end
