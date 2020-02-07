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
      if current_user.sales_id.present?
        @sales = User.find(current_user.sales_id)
      end
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
    if customer[0]
      # binding.pry
      redirect_to search_page_index_user_path(customer[0])
    else
      flash[:alert] = "該当するユーザーがいません"
      redirect_to "/users/#{params[:page_id]}/search_page_index"
    end
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
