class EventsController < ApplicationController
  def destroy
    event = Event.find(params[:id])
    customer = User.find(event.customer_id)
    event.destroy
    flash[:notice] = "イベントを削除しました"
    redirect_to "/users/#{customer.id}/search_page_index"
  end

  def create
    event = Event.new(event_params)
    if event.save
      flash[:notice] = "作業依頼が完了しました"
      redirect_to event_messages_path(event)
    elsif current_user.admin?
      flash[:alert] = "入力に誤りがあります"
      redirect_to "/users/#{params[:event][:user_id]}/search_page_index"
    else
      flash[:alert] = "入力に誤りがあります"
      redirect_to root_path
    end
  end


  private
  def event_params
    if current_user.admin?
      if params[:event][:car_id]
        car = Car.find(params[:event][:car_id])
        params.require(:event).permit(:title,:date,:car_id).merge(customer_id: car.user_id,sales_id: current_user.id)
      end
    else
      params.require(:event).permit(:title,:date,:car_id).merge(customer_id: current_user.id,sales_id: current_user.sales_id )
    end
  end
end
