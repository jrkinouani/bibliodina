class AppMailer < ActionMailer::Base

  def new_reservation(book, reservation)
    @user = User.find(book.user_id)
    @reservation = Reservation
    @book = Book
    mail(from: 'biblioruncontact@gmail.com', to: @user.email, objet: "Nouvelle réservation !")

  end



end
