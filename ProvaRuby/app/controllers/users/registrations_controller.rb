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
      resource.roles_mask = 1
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
#		super #do |resource|
#			params.require(:user).permit(:username, :email, :favourite_team)
#			resource.favourite_team = params[:user][:favourite_team]					#se uso questo simile al create non applica i
#			resource.email = params[:user][:email]														#cambiamenti non so ilperche
#			if !params[:user][:username].blank?
#				resource.username = params[:user][:username]
#			end
#		end

			super
			@user = User.find(resource.id)
			@user.email = params[:user][:email]
			@user.favourite_team = params[:user][:favourite_team]
			if !params[:user][:username].blank?											#problema di questo è che se metto un username gia
				@user.username = params[:user][:username]							#preso va avanti ma non applica NESSUN cambiamento quindi
			end																											#funziona ma l'utentenon sa che i cambiamenti non
			@user.save																							#sono stati effettuati per via dell'username già preso
																															#se uso  l'error helper che c'è nelle shared views mi
																															#servirebbe riindirizzarmi sulla stessa pagnia ma come
	end																													#al solito va in conflitto con qualche porcoddio del device

  # DELETE /resource
  def destroy
		user = resource
		lega = League.find(user.league_id)
		user.update_attributes!(:league_id => nil)
		if (user.president?)
        if lega.users.size == 0
            League.delete(lega.id)
        else
            next_president = lega.users.first
            lega.update_attributes!(:president_id => next_president.id)
            next_president.update_attributes!(:roles_mask => 2)
        end
    end
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

    protected

    def after_update_path_for(resource)
			if resource.validate
        users_path
      else
				edit_user_registration_path
			end
    end

    protected

    def after_sign_in_path_for(resource)
        if current_user.roles_mask == 4 || current_user.roles_mask == 2
            leagues_path
        elsif current_user.roles_mask == 1
            homes_path
        else
            id = resource[:id]
            admin_path(id)
        end
    end

    protected

    def after_sign_up_path_for(resource)
        homes_path
    end


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
