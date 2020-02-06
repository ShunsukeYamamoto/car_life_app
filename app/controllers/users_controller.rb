class UsersController < ApplicationController
  before_action :move_to_user_sign_in

  def index
    if current_user.admin?
      @users = User.search(params[:keyword],current_user)
      respond_to do |format|
        format.html
        format.json
      end
      @event_create = Event.new
      @sales_events = Event.where(sales_id: current_user.id)
      @event = @sales_events.first
      if @event.present?
        @customer = @event.customer
        @events = Event.where(customer_id: @event.customer.id)
        @messages = @event.messages.order(created_at: 'ASC')
        @cars = @customer.cars
      end
      @message = Message.new
      @car = Car.new
    else
      @customer_events = Event.where(customer_id: current_user.id).order(date: "ASC")
      @sales = User.find(current_user.sales_id)
      @cars = current_user.cars.order(created_at: 'ASC')
      if @customer_events.present?
        @messages = @customer_events.first.messages.order(created_at: 'ASC')
      end
      @event = @customer_events.first
      @message = Message.new
      @event_create = Event.new
    end
  end

  def search_page
    customer = User.search_person(params[:keyword])
    redirect_to search_page_index_user_path(customer[0])
  end

  def search_page_index
    @users = User.search(params[:keyword],current_user)
    @event_create = Event.new
    @sales_events = Event.where(sales_id: current_user.id)
    @customer = User.find(params[:id])
    @events = Event.where(customer_id: @customer.id)
    @event = @events.first
    if @event.present?
      @messages = @event.messages.order(created_at: 'ASC')
    end
    @message = Message.new
    @car = Car.new
    @cars = @customer.cars
  end

  private

  def move_to_user_sign_in
    redirect_to user_session_path unless user_signed_in?
  end
end
