class BooksController < ApplicationController



  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
    @book_comment = BookComment.new
    @book_comment_comment = @book.book_comments
  end

  def show
     @book = Book.find(params[:id])
     @user = @book.user
     @newbook = Book.new
     @book_comment = BookComment.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
     redirect_to books_path
    end
  end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
     else
      render :edit


     end
  end


 private

   def book_params
    params.require(:book).permit(:body, :title)
   end

end
