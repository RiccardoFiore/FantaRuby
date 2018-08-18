require "rails_helper"

describe HomesController, :type => :controller do
    before :each do
        @president1=FactoryBot.create(:president1_a)
        @league1=FactoryBot.create(:league1_a, president_id: @president1.id)
        @president1.league_id=@league1.id
        @president1.save
        @player2=FactoryBot.create(:player2_a)
        @player2.save
        sign_in @player2
    end

    describe "List of all leagues" do
        it "index has a 200 status code" do
            get :index
            expect(response.status).to eq(200)
        end
        it "render a list of all leagues in the home page" do
            get :index
            expect(response).to render_template(:index)
        end
    end
    describe "Show league's details" do

        it "show has a 200 status code" do
            params = { id: @league1.id }
            get :show, params:params
            expect(response.status).to eq(200)
        end
        it "render details of a league" do
            params = { id: @league1.id }
            get :show, params:params
            expect(response).to render_template(:show)
        end
    end
    describe "Update league" do

        it "update has a 302 status code" do
            params = { id: @league1.id }
            get :update, params:params
            expect(response.status).to eq(302)
        end

        it "render update league" do
            params = { id: @league1.id }
            get :update, params:params
            expect(response).to redirect_to('/roses/new/portiere')
        end
    end

end
