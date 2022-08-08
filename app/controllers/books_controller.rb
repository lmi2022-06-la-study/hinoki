class BooksController < ApplicationController
  before_action :require_logged_in
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @books = Book.all
  end

  def show

  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.book.build(book_params)
    if @book.save
      flash[:success] = '登録しました'
      redirect_to book_path(@book)
    else
      flash.now[:danger] = '登録失敗！！'
      render :new
    end
  end
  def edit
    
  end
  def update
    if @book.update(book_params)
      flash[:success] = '更新しました'
      redirect_to @book
    else
      flash.now[:danger] = '更新失敗！！'
      render :edit
    end
    end
  end
  def destroy
    @book.destroy
    flash[:success] = '削除！！！！'
    redirect_to root_path
    


  end
  private
  def book_params
    params.require(:book).permit(:title, :publisher, :author, :review)
  end
  # ??
  def correct_user
    if @book.user_id != current_user.id
      redirect_to root_path
    end
  end
  # @bookの宣言
  def set_book
    @book = Book.find(params[:id])
  end
end
