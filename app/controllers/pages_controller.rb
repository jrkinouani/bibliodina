class PagesController < ApplicationController
  def home
    #@books = Book.all
    @books = Book.order("RANDOM()")
    @booker = Book.count

  end

  def charte
  end
  def apropos

  end

  def all
    if params[:genre].blank?
      @books = Book.all.order("created_at DESC")
    else
      @genre_id = Genre.find_by(name: params[:genre]).id
      @books = Book.where(genre_id: @genre_id).order("created_at DESC")
    end
  end

  def search
    @books = Book.all
    if params[:search]
    @books = Book.search(params[:search]).order("created_at DESC")
    else
    @books = Book.all.order('created_at DESC')
    end
  end
end
