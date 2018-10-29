class UsersController < ApplicationController
  def index
  	@book = Book.new
  	@user = User.find(current_user.id)
  	@users = User.all
  end

  def show
  	@book = Book.new
    @books = User.find(params[:id]).books.all
  	@user = User.find(params[:id])
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
            redirect_to user_path(current_user.id)
        end
  end

  def edit
    if current_user.id != params[:id].to_i
      flash[:notice] = "access dinied"
      redirect_to "/"
    else
      @user = User.find(params[:id])
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
          flash[:notice] = "successfully profile updated"
          redirect_to user_path(current_user.id)
        else
          flash[:alert] = "failed to update profile"
          redirect_to user_path(current_user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
