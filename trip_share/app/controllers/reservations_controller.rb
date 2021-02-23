class ReservationsController < ApplicationController
  
    def index
     @reservations = Reservation.all
    end
     
     def new
       @reservation = Reservation.new(
         start_date: params[:start_date],
         end_date: params[:end_date],
         group: params[:group],
         room_id: params[:room_id],
         n1_price: params[:n1_price],
         total_price: params[:n1_price] * params[:group].to_i * (params[:end_date].to_i - params[:start_date].to_i),
         user_id: @current_user.id
       )
     end
     
     def create
       @reservation = Reservation.new(
         start_date: params[:start_date],
         end_date: params[:end_date],
         group: params[:group],
         total_price: (end_date - start_date) * @roon.price,
         user_id: @current_user.id,
         room_id: params[:room_id]
         )
       if @reservation.save
          redirect_to("/reservations/#{@reservation.id}")
       else
          render("reservations/new")
       end
     end
     
end
