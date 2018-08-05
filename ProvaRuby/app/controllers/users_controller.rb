class UsersController < ApplicationController

  helper_method :help_formazioni

  def index
    @user = User.find(current_user.id)
    if @user.league_id
        @league = League.find(@user.league_id)
    else
        @league = -1
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.league_id
        @league = League.find(@user.league_id)
    else
        @league = -1
    end
  end

  def update
    user = User.find(current_user.id)
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
    user.update_attributes!(:roles_mask => 1)
    redirect_to homes_path
  end

  def destroy
    user = User.find(params[:id])
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
    user.destroy
    flash[:success] = "User destroyed."
	redirect_to '/admins'
  end


  def ranking
    authorize! :ranking, User, :message => 'Non hai i permessi per accedere alla classifica'
    all_Player=User.where('league_id = ?',current_user.league_id)
    @formazioni = []
    val=0
    all_Player.each do |user|
        if Formazioni.where('user_id =?',user.id).count > 0
            f=Formazioni.where('user_id =?',user.id)
            f.each do |x|
                val = val + x.punteggio
        end
    end
    @formazioni << [User.find(user.id).username,val]
    end
  end

end
