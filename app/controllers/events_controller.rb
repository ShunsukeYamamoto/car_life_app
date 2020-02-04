class EventsController < ApplicationController
  def destroy
    event = Event.find(params[:id])
    event.destroy
    flash[:notice] = "イベントを削除しました"
    redirect_to root_path
  end

  def create

    event = Event.new(event_params)
    if event.save
      flash[:notice] = "作業依頼が完了しました"
      redirect_to event_messages_path(event)
    else
      flash[:alert] = "入力に誤りがあります"
      redirect_to root_path
    end
  end


  private
  def event_params
    if current_user.admin?
      car = Car.find(params[:event][:car_id])
      params.require(:event).permit(:title,:date,:car_id).merge(customer_id: car.user_id,sales_id: current_user.id)
    else
      params.require(:event).permit(:title,:date,:car_id).merge(customer_id: current_user.id,sales_id: current_user.sales_id )
    end
  end
end
