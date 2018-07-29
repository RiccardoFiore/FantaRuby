# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
    super do |resource|
      params.require(:user).permit(:username, :roles_mask, :favourite_team)
      resource.roles_mask = "3"
      resource.favourite_team = params[:user][:favourite_team]
      if !params[:user][:username].blank?
				resource.username = params[:user][:username]
			else
				resource.username = params[:user][:email].split("@")[0]+ "_" + params[:authenticity_token][14..16]
			end
			
    end
   end

  # GET /resource/edit	
	def edit
		super
		@user = User.find(resource.id)
	end

  # PUT /resource
	def update
#		super do |resource|
#			params.require(:user).permit(:username, :email, :favourite_team)
#			resource.favourite_team = params[:user][:favourite_team]
#			resource.email = params[:user][:email]
#			if !params[:user][:username].blank?
#				resource.username = params[:user][:username]
#			end
#			if !resource.validate
#				render 'edit'
#				next
#			end			
#		end

			super
			@user = User.find(resource.id)
			@user.email = params[:user][:email]
			@user.favourite_team = params[:user][:favourite_team]
			if !params[:user][:username].blank?											#problema di questo è che se metto un username gia 
				@user.username = params[:user][:username]							#preso va avanti ma non applica NESSUN cambiamento quindi
			end																											#funziona ma l'utentenon sa che i cambiamenti non 
			if !@user.save																					#sono stati effettuati per via dell'username già preso
				#redirect_to 'edit'																		#se uso  l'error helper che c'è nelle shared views mi
			end																											#servirebbe riindirizzarmi sulla stessa pagnia ma come
	end																													#al solito va in conflitto con qualche porcoddio del device

  # DELETE /resource
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
