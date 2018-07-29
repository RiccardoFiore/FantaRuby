class AdminsController < ApplicationController

	def player_settings
		@users = User.all
	end

end
