class BooksController < ApplicationController
  def index
    # render json: Book.all
    @books = Book.all
  end

  def new
    # book = Book.create(params[:title], params[:author])
    # book
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to action: :index
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])

    if book.destroy
      # render json: book
      redirect_to action: :index
    else
      render json: "can't destory"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
