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
                @socce= @socce = SoccersPlayer.all
		@rose=@rose.find_by_user_id(id)
                if @rose!=nil
	        @p1=@socce.find(@rose.portiere1)
		@p2=@socce.find(@rose.portiere2)
		@p3=@socce.find(@rose.portiere3)
		@d1=@socce.find(@rose.difensore1)
		@d2=@socce.find(@rose.difensore2)
		@d3=@socce.find(@rose.difensore3)
		@d4=@socce.find(@rose.difensore4)
		@d5=@socce.find(@rose.difensore5)
		@d6=@socce.find(@rose.difensore6)
		@d7=@socce.find(@rose.difensore7)
		@c1=@socce.find(@rose.centrocampista1)
		@c2=@socce.find(@rose.centrocampista2)
		@c3=@socce.find(@rose.centrocampista3)
		@c4=@socce.find(@rose.centrocampista4)
		@c5=@socce.find(@rose.centrocampista5)
		@c6=@socce.find(@rose.centrocampista6)
		@c7=@socce.find(@rose.centrocampista7)
		@c8=@socce.find(@rose.centrocampista8)
		@a1=@socce.find(@rose.attaccante1)
		@a2=@socce.find(@rose.attaccante2)
		@a3=@socce.find(@rose.attaccante3)
		@a4=@socce.find(@rose.attaccante4)
		@a5=@socce.find(@rose.attaccante5)
		@a6=@socce.find(@rose.attaccante6)
		@i=@p1.quotazione+@p3.quotazione+@p2.quotazione+@a2.quotazione+@a3.quotazione+@a4.quotazione+@a5.quotazione+@a6.quotazione+@a1.quotazione+@d1.quotazione+@d2.quotazione+@d3.quotazione+@d4.quotazione+@d5.quotazione+@d6.quotazione+@d7.quotazione+@c1.quotazione+@c2.quotazione+@c3.quotazione+@c4.quotazione+@c5.quotazione+@c6.quotazione+@c7.quotazione+@c8.quotazione

		if @p1.ruolo!="portiere"||@p2.ruolo!="portiere"||@p3.ruolo!="portiere"||@a1.ruolo!="attaccante"||@a2.ruolo!="attaccante"||@a3.ruolo!="attaccante"||@a4.ruolo!="attaccante"||@a5.ruolo!="attaccante"||@a6.ruolo!="attaccante"||@c1.ruolo!="centrocampista"||@c2.ruolo!="centrocampista"||@c3.ruolo!="centrocampista"||@c4.ruolo!="centrocampista"||@c5.ruolo!="centrocampista"||@c6.ruolo!="centrocampista"||@c7.ruolo!="centrocampista"||@c8.ruolo!="centrocampista"||@d1.ruolo!="difensore"||@d2.ruolo!="difensore"||@d3.ruolo!="difensore"||@d4.ruolo!="difensore"||@d5.ruolo!="difensore"||@d6.ruolo!="difensore"||@d7.ruolo!="difensore"||current_user.budget-@i<0
       params[:id]=current_user.id
       destroy     
end
if(@rose.portiere1==@rose.portiere2)||(@rose.portiere1==@rose.portiere3)|| (@rose.portiere2==@rose.portiere3)||(@rose.difensore1==@rose.difensore2)||(@rose.difensore1==@rose.difensore3)||(@rose.difensore1==@rose.difensore4)||(@rose.difensore1==@rose.difensore5)||(@rose.difensore1==@rose.difensore6)||(@rose.difensore1==@rose.difensore7)||(@rose.difensore2==@rose.difensore3)||(@rose.difensore2==@rose.difensore4)||(@rose.difensore2==@rose.difensore5)||(@rose.difensore2==@rose.difensore6)||(@rose.difensore2==@rose.difensore7)||(@rose.difensore3==@rose.difensore4)||(@rose.difensore3==@rose.difensore5)||(@rose.difensore3==@rose.difensore6)||(@rose.difensore3==@rose.difensore7)||(@rose.difensore4==@rose.difensore5)||(@rose.difensore4==@rose.difensore6)||(@rose.difensore4==@rose.difensore7)||(@rose.difensore5==@rose.difensore6)||  (@rose.difensore5==@rose.difensore7)||(@rose.difensore6==@rose.difensore7)||(@rose.centrocampista1==@rose.centrocampista2)||(@rose.centrocampista1==@rose.centrocampista3)||(@rose.centrocampista1==@rose.centrocampista4)||(@rose.centrocampista1==@rose.centrocampista5)||(@rose.centrocampista1==@rose.centrocampista6)||(@rose.centrocampista1==@rose.centrocampista7)||(@rose.centrocampista1==@rose.centrocampista8)||(@rose.centrocampista2==@rose.centrocampista3)||(@rose.centrocampista2==@rose.centrocampista4)||(@rose.centrocampista2==@rose.centrocampista5)||(@rose.centrocampista2==@rose.centrocampista6)||(@rose.centrocampista2==@rose.centrocampista7)||(@rose.centrocampista2==@rose.centrocampista8)||(@rose.centrocampista3==@rose.centrocampista4)||(@rose.centrocampista3==@rose.centrocampista5)||(@rose.centrocampista3==@rose.centrocampista6)||(@rose.centrocampista3==@rose.centrocampista7)||(@rose.centrocampista3==@rose.centrocampista8)||(@rose.centrocampista4==@rose.centrocampista5)||(@rose.centrocampista4==@rose.centrocampista6)||(@rose.centrocampista4==@rose.centrocampista7)||(@rose.centrocampista4==@rose.centrocampista8)||(@rose.centrocampista5==@rose.centrocampista6)||(@rose.centrocampista5==@rose.centrocampista7)||(@rose.centrocampista5==@rose.centrocampista8)||(@rose.centrocampista6==@rose.centrocampista7)||(@rose.centrocampista6==@rose.centrocampista8)||(@rose.centrocampista7==@rose.centrocampista8)||(@rose.attaccante1==@rose.attaccante2)||(@rose.attaccante1==@rose.attaccante3)||(@rose.attaccante1==@rose.attaccante4)||(@rose.attaccante1==@rose.attaccante5)||(@rose.attaccante1==@rose.attaccante6)||(@rose.attaccante2==@rose.attaccante3)||(@rose.attaccante2==@rose.attaccante4)||(@rose.attaccante2==@rose.attaccante5)||(@rose.attaccante2==@rose.attaccante6)||(@rose.attaccante3==@rose.attaccante4)||(@rose.attaccante3==@rose.attaccante5)||(@rose.attaccante3==@rose.attaccante6)||(@rose.attaccante4==@rose.attaccante5)||(@rose.attaccante4==@rose.attaccante6)||(@rose.attaccante5==@rose.attaccante6)

params[:id]=current_user.id
destroy
end
		
end
			 
   		
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
           if Rose.find_by_user_id(id)!=nil
           Rose.find_by_user_id(id).destroy 
           end   
          flash[:success] = "rosa destroyed."
          	
   
	end


end
