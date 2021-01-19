class BooksController < ApplicationController
  before_action :authenticate_user!,except: [:home]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :move_to_home, only: [:edit, :update, :destroy]
  
  def home
  end  
  
  
  def index
    @books = Book.all
    # @book = Book.where(category_id: 2)
    @bookcategory = Book.new
    @bookcategory = Book.where(category_id: params[:category_id])
    @params_controller = params[:params_controller]
    @booklike = Book.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}

  end
  
  # def categoryNovel
  # end

  # def categoryHoby
  #   @book = Book.where(category_id: 6)
  # end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy 
    redirect_to root_path if @book.destroy
  end


  def show
    @books = Book.where(user_id: @book.user)
  end

  private
  def book_params
    params.require(:book).permit(:title, :image, :text, :author, :time, :url, :category_id, :review_id).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_home
    redirect_to root_path unless current_user.id == @book.user.id    
  end
end
