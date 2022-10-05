class AuthController < ApplicationController
    def create
        @user = User.create(user_register_params);

        if @user.valid?
            token = encode_token({user_id: @user.id});
            render json: {user: @user, token: token}, status: :created;
        else
            render json: {error: "User was not created"}, status: :unprocessable_entity
        end
    end

    private

    def user_register_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
    
end
