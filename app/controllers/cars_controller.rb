class CarsController < ApplicationController

  def create
    car = Car.new(car_params)
    if car.save
      redirect_to search_page_index_user_path(car.user_id)
    else
      flash[:alert] = "入力に誤りがあります"
      redirect_to "/users/#{car.user_id}/search_page_index"
    end
  end

  def update
    car = Car.find(params[:id])
    if car.update(car_params)
      if params[:car][:image]
        car.update(image: params[:car][:image])
      end
      flash[:notice] = "車両情報が更新されました"
      redirect_to "/users/#{car.user_id}/search_page_index"
    else
      flash[:alert] = "入力に誤りがあります"
      redirect_to event_messages_path(car.events.first)
    end
  end

  def destroy
    car = Car.find(params[:id])
    if car.destroy
      flash[:notice] = "登録車両を削除しました"
      redirect_to search_page_index_user_path(car.user_id)
    end
  end


  private

  def car_params
    costumer = User.find(params[:user_id])
    params.require(:car).permit(:name,:model_year,:inspection_date,:distance,:image).merge(user_id: costumer.id)
  end

end
