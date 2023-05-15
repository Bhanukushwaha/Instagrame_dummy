module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
    def new
      super
    end

    def create
      @user = User.find_by_email(params[:user][:email])
      if @user.present?
        @error = {message: "User is already present", email: true}
      else        
         if (params[:user][:password] != params[:user][:password_confirmation])
          @error = {message: "password does not match?", email: false }
         else
          user = User.new(first_name: params[:user][:first_name],last_name: params[:user][:last_name],image: params[:user][:image], email: params[:user][:email],password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
            if user.save
              @valid = true
              sign_in(user)
            else
               respond_to do |format|
                format.js
               end
            end  
         end
      end
    end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # # PUT /resource
    # def update
    #   super
    # end

    # # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    # super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
