class ReservationsController < ApplicationController
  
  before_action :set_current_room,{only:[:new,:create]}
    
    def index
     @reservations = Reservation.all
     @rooms = Room.all 
    end
     
     def new
       @reservation = Reservation.new(
         start_date: params[:start_date],
         end_date: params[:end_date],
         group: params[:group],
         n1_price: params[:n1_price],
         user_id: @current_user.id,
         room_id: @current_room.id,
       )
     end
     
     def create
       @reservation = Reservation.new(
         start_date: params[:start_date],
         end_date: params[:end_date],
         group: params[:group],
         total_price: params[:total_price],
         user_id: @current_user.id,
         room_id: @current_room.id
         )
       if @reservation.save
          redirect_to("/reservations/#{@reservation.id}")
       else
          render("reservations/new")
       end
     end
     
     def show
        @reservation = Reservation.find_by(id: params[:id])
        @room = @reservation.room
     end
     
     def destroy
        @reservation = Reservation.find_by(id: params[:id])
        if @reservation.destroy
         flash[:notice] = "予約を削除しました"
         redirect_to("reservations")
        end
     end
end
