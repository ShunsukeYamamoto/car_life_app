class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      # binding.pry
      respond_to do |format|
        format.json
      end
    else
      redirect_to event_messages_path(@message.event.id)
    end
  end

  def index
    if current_user.admin?
      @sales_events = Event.where(sales_id: current_user.id).order(date: "ASC")
      @event = Event.find(params[:event_id])
      @messages = @event.messages.order(created_at: 'ASC')
      @message = Message.new
      @customer = @event.customer
      @events = Event.where(customer_id: @customer.id)
      @car = Car.new
      @cars = @customer.cars
    else
      @customer_events = Event.where(customer_id: current_user.id).order(date: "ASC")
      @cars = current_user.cars.order(created_at: 'ASC')
      @event = Event.find(params[:event_id])
      @messages = @event.messages.order(created_at: 'ASC')
      @message = Message.new
      @event_create = Event.new
    end
  end

  def auto_update_sales
    event = Event.find(params[:event_id])
    message_id = params[:message_id].to_i
    sales = User.find(event.sales_id)
    @messages = event.messages.where("id > #{message_id}").where.not("talker_id = #{sales.id}")
  end

  def auto_update_customer
    event = Event.find(params[:event_id])
    message_id = params[:message_id].to_i
    customer = User.find(event.customer_id)
    @messages = event.messages.where("id > #{message_id}").where.not("talker_id = #{customer.id}")
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
