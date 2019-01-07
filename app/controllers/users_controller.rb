class UsersController < ApplicationController
  before_action :fordid_not_login_user ,{only: [:edit,:update,:show]}
  before_action :forbid_not_current_user ,{only: [:edit,:update] }
  before_action :fordid_login_user ,{only: [:signup,:create]}
  
  
  def show
    @user  = User.find_by(id: params[:id])
    @books = Book.where(user_id: @user.id)
  end
  
  def signup
    @user = User.new()
  end
  
  def login_form
    @user = User.new()
  end  
  
  def logout
    session[:user_id] = nil
    redirect_to('/')
  end
  
  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/show/#{@user.id}")
    else
      @error_massage = "password or email is different !!"
      render("users/login_form")
    end
  end
  
  def create
      @user = User.new(email: params[:email],name: params[:name],password: params[:password],user_image_name:"cat.png")
    
    if params[:password] == params[:confirmation_password] && @user.save
      @user.save
      redirect_to("/users/show/#{@user.id}")
      session[:user_id] = @user.id
    else
      render("users/signup")
    end
    
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    if params[:image]
      @user.user_image_name = "#{@user.id}.png"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.user_image_name}", image.read)
    else 
      @user.user_image_name = "cat.png"
    end
    
    if  @user.save && @user.password == params[:password]
         redirect_to("/users/show/#{@user.id}")
      else
           @error_massage = "パスワードが違います." 
          render("users/edit")
    end
  end
  
  def  posts
     @user  = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id].to_i)
  end
  
end
