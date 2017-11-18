class BooksController < ApplicationController
  before_action :set_book, only:[:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    if params[:category].blank?
      @books = Book.all.order("created_at DESC")
    else
      @category_id = Category.find_by(genre: params[:category]).id
      @books = Book.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book, notice: "Votre livre a été ajouté avec succès :-) "
    else
      render :new
    end
  end

  def show
    @booked = Reservation.where("book_id = ? AND user_id = ? ", @book.id, current_user.id).present?
    if current_user
      @reviews = @book.reviews
      @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Modification enregistrée... :-) "
    else
        render :edit
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:author, :title, :summery, :bonus,:image, :category_id, :active)
  end
end
