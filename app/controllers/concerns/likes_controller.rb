class LikesController < ApplicationController
  def create
     @like = Like.new(user_id: @current_user.id.to_i ,post_id: params[:id].to_i)
     @like.save
     redirect_to("/posts/index")
  end
  
  def destroy
     @like = Like.find_by(user_id: @current_user.id.to_i ,post_id: params[:id].to_i)
     @like.destroy
     redirect_to("/posts/index")
  end
  
end
