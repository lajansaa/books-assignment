class BooksController < ApplicationController
	before_action :set_book, :only => [:show, :edit, :update, :destroy]

	def index
	  @books = Book.page(params[:page]).per(5)
	end

	def new
	  @book = Book.new
	end

	def create
    @book = Book.new(book_params)
		if @book.save
			redirect_to books_path
      flash[:notice] = "Your book was successfully added!"
		else
			render new_book_path
		end
	end

	def show
	end

	def edit
	end

  def update
		if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "Your book was successfully updated!"
    else
      render edit_book_path
    end
	end

	def destroy
 		@event.destroy
 		redirect_to books_path
    flash[:alert] = "Your book was successfully deleted!"
 	end

	private

	def book_params
		params.require(:book).permit(:title, :author, :genre, :description)
	end

	def set_book
		@book = Book.find(params[:id])
	end

end
