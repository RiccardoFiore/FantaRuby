class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
        if current_user.roles_mask != 3
            leagues_path
        else
            homes_path
        end
    end

    def after_sign_up_path_for(resource)
        homes_path
    end


    def set_current_user
        @current_user |= User.where(:id => session[:id])
    end



    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end
end
