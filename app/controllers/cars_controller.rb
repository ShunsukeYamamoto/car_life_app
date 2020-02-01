class CarsController < ApplicationController
  def create
    car = Car.new(car_params)
    if car.save
      redirect_to event_messages_path(car.user_id)
    else
      flash[:alert] = "入力が誤っています"
      redirect_to event_messages_path(car.user_id)
    end
    # redirect_to event_messages_path(car.user_id)
  end

  def car_params
    costumer = User.find(params[:user_id])
    params.require(:car).permit(:name,:model_year,:inspection_date,:distance,:image).merge(user_id: costumer.id)
  end
end
