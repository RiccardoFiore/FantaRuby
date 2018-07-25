class LeaguesController < ApplicationController
    before_action :authenticate_user!

    def new
        @league = League.new
    end

    def create
        @user = current_user
		@league = League.new(params[:league].permit(:name, :players, :status, :description, :user))
		#authorize! :create, @league, :message => "BEWARE: You are not authorized to create new movies."
        @league.president_id = @user.id
		@league.save!
        flash[:notice] = "#{@league.name} was successfully created."
		redirect_to leagues_path
	end

end
