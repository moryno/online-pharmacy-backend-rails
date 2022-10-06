class UsersController < ApplicationController

   def show
    if @user.profile.is_admin
        current_user = find_user
        if current_user
            render json: current_user, status: :ok
        else
            render_user_not_found_response
        end
    else
        render json: {error: "Only admin is authorized to do that!"}
    end
   end

   def update
    current_user = find_user
    if current_user
       current_user.update(user_params)
       render json: current_user, status: :accepted
    else
        render_user_not_found_response
    end
   end

   private
   
   def find_user
    User.find_by(id: params[:id])
   end

   def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
   end

   def render_user_not_found_response
    render json: {error: "User Not Found!"}, status: :not_found
   end
end
