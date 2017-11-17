class PagesController < ApplicationController
  def home
    @books = Book.all
  end

  def all
    if params[:category].blank?
      @books = Book.all.order("created_at DESC")
    else
      @category_id = Category.find_by(genre: params[:category]).id
      @books = Book.where(category_id: @category_id).order("created_at DESC")
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
