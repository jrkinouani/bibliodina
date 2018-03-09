class AppMailer < ActionMailer::Base

  def new_reservation(book, reservation)
    @user = User.find(book.user_id)
    @reservation = reservation
    @book = book
    mail(from: 'biblioruncontact@gmail.com', to: @user.email, subjectt: "Nouvelle réservation !")

  end



end
