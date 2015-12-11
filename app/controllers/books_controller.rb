class BooksController < ApplicationController

	include BooksHelper

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@books = Book.all.order(:pubdate)
	end

	def show
		@book = Book.find(params[:id])
	end
	
	def new
		@book = Book.new
	end
	
	def create
		@book = Book.new(book_params)
		if @book.save
			flash[:success] = 'Book successfully added'
			redirect_to books_path
		else
			flash[:error] = @book.errors
			render :new
		end
	end
	
	def edit
		@book = Book.find(params[:id])
	end
	
	def update
		@book = Book.find(params[:id])
		
		if @book.update(book_params)
			flash[:success] = "Book updated"
			redirect_to books_path
		else
			flash[:error] = @book.errors
			render :edit
		end
	end
	
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		
		redirect_to books_path
	end
	
end
