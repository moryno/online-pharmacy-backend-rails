class UsersController < ApplicationController

   def show
    if @user.profile.is_admin
        current_user = find_user
        if current_user
            render json: current_user, status: :ok
        else
            render json: {error: "No user found"}, status: :not_found
        end
    else
        render json: {error: "Only admin is authorized to do that!"}
    end
   end

   private
   
   def find_user
    User.find_by(id: params[:id])
   end
end
