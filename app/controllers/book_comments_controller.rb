class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		book_comment = current_user.book_comments.new(book_comments_params)
		book_comment.book_id = book.id
		book_comment.save
		redirect_back(fallback_location: root_path)

	end

	def destroy
		BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comments_params
		params.require(:book_comment).permit(:comment)
	end
end
