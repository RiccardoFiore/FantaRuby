class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
            if @user.username.blank?
				@user.username = @user.email.split("@")[0]+ "_"+rand(10..900).to_s
			end
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?

        else
            session["devise.facebook_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_path
        end
    end

    def twitter
        @user = current_user
        @user.update_attributes!(:twitter_user_token => request.env["omniauth.auth"]["extra"]["access_token"].token)
        @user.update_attributes!(:twitter_user_secret => request.env["omniauth.auth"]["extra"]["access_token"].secret)
        @user.update_attributes!(:t_provider => request.env["omniauth.auth"].provider)
        @user.update_attributes!(:t_uid => request.env["omniauth.auth"].uid)
        set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
        redirect_to user_path(current_user.id)
    end

    def failure
        redirect_to root_path
    end
end
