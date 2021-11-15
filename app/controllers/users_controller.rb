class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @books = Book.where(user_id: @user.id)
     @book = Book.new
     @book_comment = BookComment.new

  end

  def index
     @users = User.all
     @book = Book.new
     @books = Book.all
     @user = current_user
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'Book was successfully updated.'
     else
      render :edit
     end
  end

  def edit
     @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

 private

   def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
   end
 end