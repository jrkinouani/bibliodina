class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def preload
       book = Book.find(params[:book_id])
       today = Date.today
       reservations = book.reservations.where("start_date >= ? OR end_date >= ?", today, today)

       render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date)
    }

    render json: output
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      AppMailer.new_reservation(Book.find(@reservation.book_id), @reservation).deliver_now
    redirect_to  @reservation.book, notice: "Votre réservation a été acceptée"
    end
  end

  def vos_emprunts
    @emprunts = current_user.reservations
  end

  def mes_reservations
    @books = current_user.books
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total, :book_id)
  end

  def is_conflict(start_date, end_date)
    book = Book.find(params[:book_id])
    check = book.reservations.where("? < start_date AND end_date < ?",start_date, end_date)
    check.size > 0 ? true : false
  end

end
