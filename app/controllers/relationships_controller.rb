class RelationshipsController < ApplicationController
	# before_action :set_user

  def create
   follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_to users_path
  end

  def destroy
  follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to users_path
  end

  # private
  # def
  #   @user = User.find(params[:relationship][:follow_id])
  # end
end
