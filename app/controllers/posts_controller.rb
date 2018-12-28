class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def create_form
    @book = Book.find_by(id: params[:id])
  end
  
  def create
    @book = Book.find_by(id: params[:id])
    @post = Post.new(user_id: @current_user.id, content: params[:content],book_image_name: params[:id])
    if @post.save
      redirect_to("/posts/index")
    else 
      @error_massage = "どこか間違ってます"
      render("posts/create_form")
    end
  end
  
  def destroy
    
  end
  
end
