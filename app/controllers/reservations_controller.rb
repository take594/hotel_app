class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def new
    @room = Room.find(params[:format])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save!
      flash[:notice] = "予約しました"
      redirect_to root_path
    else
      flash[:notice] = "予約に失敗しました"
      render "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "予約の情報を更新しました"
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] ="予約を削除しました"
    redirect_to reservations_path
  end

  private
    def reservation_params
      params.require(:reservation).permit(:room_id, :roomImage, :roomName, :roomIntroduction, :roomRate, :checkIn, :checkOut, :numberOfPeople)
    end

end
