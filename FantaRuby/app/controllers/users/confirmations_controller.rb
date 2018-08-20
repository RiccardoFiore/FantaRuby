# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
    def show
      super do |resource|
          params.require(:user).permit(:username, :roles_mask, :favourite_team)
          resource.roles_mask = 1
          resource.favourite_team = params[:user][:favourite_team]
          if !params[:user][:username].blank?
            resource.username = params[:user][:username]
          else
            resource.username = params[:user][:email].split("@")[0]+ "_" + params[:authenticity_token][14..16]
          end

        end
    end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
