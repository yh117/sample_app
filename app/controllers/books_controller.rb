class BooksController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def create
		@book = current_user.books.build(book_params)
		if @book.save
			flash[:success] = "Book Added!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@book.destroy if @book != nil
		redirect_to root_url
	end

	private
		def book_params
			params.require(:book).permit(:name)
		end

		def correct_user
			@book = current_user.books.find_by(id: params[:id])
			redirect_to root_url if @book.nil?
		end
end