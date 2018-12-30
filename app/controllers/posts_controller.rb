class PostsController < ApplicationController
before_action :fordid_not_book_owner,{only: [:create_form,:create]}

  def index
    @posts = Post.all.order(id: :desc )
  end
  
  def create_form
    @book = Book.find_by(id: params[:id])
  end
  
  def create
    @book = Book.find_by(id: params[:id])
    @post = Post.new(user_id: @current_user.id, content: params[:content],book_image_name: @book.book_image_name)
    if @post.save
      redirect_to("/posts/index")
    else 
      @error_massage = "どこか間違ってます"
      render("posts/create_form")
    end
  end
  
  def destroy
    
  end
  
  
   def fordid_not_book_owner
    @book = Book.find_by(id: params[:id])
    if @book.user_id ==  @current_user.id
      
    else
      redirect_to("/users/show/#{@current_user.id}")
    end
  end
  
end
