class RosesController < ApplicationController
    before_action :authenticate_user!
	 def index
                 
        id = current_user.id
        @rose = Rose.find(id)

	@socce= SoccersPlayer.all
     

         end
	def show
          id = params[:id]
		@rose = Rose.all
                @socce = SoccersPlayer.all
		@rose=@rose.find_by_user_id(id)
         
   		
	end
    
	def new
          
          @rose = Rose.new
          @socce = SoccersPlayer.all
        

        end
	def create


		@user = current_user
                @rose = Rose.new(params[:rose].permit(:portiere1, :portiere2, 
:portiere3, :difensore1,:difensore2,:difensore3,:difensore4,:difensore5,:difensore6,:difensore7,:centrocampista1,
:centrocampista2,:centrocampista3,:centrocampista4,:centrocampista5,
:centrocampista6,:centrocampista7,:centrocampista8,:attaccante1,
:attaccante2,:attaccante3,:attaccante4,:attaccante5,:attaccante6))
	
      @rose.update_attributes!(:user_id => @user.id)
      

	redirect_to rose_path(@rose.user_id)

	end
	def update
      
	end
        def delete_d
           redirect_to rose_path(@rose.user_id)
        end
	def destroy
                id = params[:id]
           Rose.find_by_user_id(id).destroy
          flash[:success] = "rosa destroyed."
          	redirect_to leagues_path
    
	end


end
