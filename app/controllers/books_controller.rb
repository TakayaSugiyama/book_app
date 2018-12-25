class BooksController < ApplicationController
  def index
    if params[:keyword]
      @items = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end
  
  def create
    @book = Book.new(user_id: @current_user.id,book_title: params[:title],book_image_name: params[:isbn])
    if @book.save
      redirect_to("/users/show/#{@current_user.id}") 
    else
      render("books/index")
    end
  end
  
  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    redirect_to("/users/show/#{@current_user.id}")
  end
  
end
