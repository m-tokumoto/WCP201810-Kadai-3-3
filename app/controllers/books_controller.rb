class BooksController < ApplicationController
    def new
    	@book = Book.new
    end
    def create
    	@book = Book.new
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	if @book.save
            flash[:notice] = "successfully created."
    	    redirect_to book_path(@book.id)
        else
            flash[:alert] = "failed to create."
            redirect_to books_path
        end
    end
    
    def index
        @book = Book.new
    	@books = Book.all
        @user = current_user
    end
    
    def show
        @book = Book.new
    	@boook = Book.find(params[:id])
        @user = User.find(current_user.id)
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user.id != current_user.id
            flash[:notice] = "access dinied"
            redirect_to "/"
        end
    end

    def destroy
        @book = Book.find(params[:id])
        if @book.user.id != current_user.id
            flash[:notice] = "access dinied"
            redirect_to "/"
        else
            @book.destroy
            flash[:notice] = "successfully deleted book"
            redirect_to books_path
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "successfully updated"
            redirect_to book_path(@book.id)
        else
            flash[:notice] = "failed to update"
            redirect_to books_path
        end
    end

    private
    def book_params
    	params.require(:book).permit(:book_title, :book_body,  :user_id)
    end
end
