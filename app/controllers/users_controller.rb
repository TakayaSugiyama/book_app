class UsersController < ApplicationController
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
    @user.password = params[:password]
    
    if params[:image]
      @user.user_image_name = "#{@user.id}.png"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.user_image_name}", image.read)
    else 
      @user.user_image_name = "cat.png"
    end
    
    if  @user.save
         redirect_to("/users/show/#{@user.id}")
      else
          render("users/edit")
    end
  end
end
