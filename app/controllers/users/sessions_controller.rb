module Users
  class SessionsController < Devise::SessionsController
    # respond_to :json
    before_action :configure_sign_in_params, only: [:create]
    # GET /resource/sign_in
    def new
      super
    end

    # POST /resource/sign_in
    def create
      user =  User.where(email:  params[:user][:email]).first
      if user
        if user.valid_password?(params[:user][:password])
          @valid = true
          sign_in(user)
        else
          @error = "Your entered incorrect password"
        end
      else
        @error = "User Not Found"
        respond_to do |format|
          format.js
        end
      end
      # super
      # respond_to do |format|
      #   format.js
      # end
      # render '/users/sign_in'
    end

    # DELETE /resource/sign_out
    def destroy
      super
    end

    protected
    # If you ha/ve extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
end
