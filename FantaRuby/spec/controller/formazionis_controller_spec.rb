require "rails_helper"

describe FormazionisController, :type => :controller do
    before :each do
        @president1=FactoryBot.create(:president1_a)
        @league1=FactoryBot.create(:league1_a, president_id: @president1.id)
        @president1.league_id=@league1.id
        @president1.save
        @player1=FactoryBot.create(:player1_a)
        @player1.league_id=@league1.id
        @player1.save
        sign_in @player1
        @portiere1=FactoryBot.create(:s_p_p1)
        @portiere2=FactoryBot.create(:s_p_p2)
        @portiere3=FactoryBot.create(:s_p_p3)
        @difensore1=FactoryBot.create(:s_p_d1)
        @difensore2=FactoryBot.create(:s_p_d2)
        @difensore3=FactoryBot.create(:s_p_d3)
        @difensore4=FactoryBot.create(:s_p_d4)
        @difensore5=FactoryBot.create(:s_p_d5)
        @difensore6=FactoryBot.create(:s_p_d6)
        @difensore7=FactoryBot.create(:s_p_d7)
        @centrocampista1=FactoryBot.create(:s_p_c1)
        @centrocampista2=FactoryBot.create(:s_p_c2)
        @centrocampista3=FactoryBot.create(:s_p_c3)
        @centrocampista4=FactoryBot.create(:s_p_c4)
        @centrocampista5=FactoryBot.create(:s_p_c5)
        @centrocampista6=FactoryBot.create(:s_p_c6)
        @centrocampista7=FactoryBot.create(:s_p_c7)
        @centrocampista8=FactoryBot.create(:s_p_c8)
        @attaccante1=FactoryBot.create(:s_p_a1)
        @attaccante2=FactoryBot.create(:s_p_a2)
        @attaccante3=FactoryBot.create(:s_p_a3)
        @attaccante4=FactoryBot.create(:s_p_a4)
        @attaccante5=FactoryBot.create(:s_p_a5)
        @attaccante6=FactoryBot.create(:s_p_a6)
        @rose1=FactoryBot.create(:rose1_a,     user_id: @player1.id,
                                    portiere1: @portiere1.id,
                                    portiere2: @portiere2.id,
                                    portiere3: @portiere3.id,
                                    difensore1: @difensore1.id,
                                    difensore2: @difensore2.id,
                                    difensore3: @difensore3.id,
                                    difensore4: @difensore4.id,
                                    difensore5: @difensore5.id,
                                    difensore6: @difensore6.id,
                                    difensore7: @difensore7.id,
                                    centrocampista1: @centrocampista1.id,
                                    centrocampista2: @centrocampista2.id,
                                    centrocampista3: @centrocampista3.id,
                                    centrocampista4: @centrocampista4.id,
                                    centrocampista5: @centrocampista5.id,
                                    centrocampista6: @centrocampista6.id,
                                    centrocampista7: @centrocampista7.id,
                                    centrocampista8: @centrocampista8.id,
                                    attaccante1: @attaccante1.id,
                                    attaccante2: @attaccante2.id,
                                    attaccante3: @attaccante3.id,
                                    attaccante4: @attaccante4.id,
                                    attaccante5: @attaccante5.id,
                                    attaccante6: @attaccante6.id )
        @formazioni1=FactoryBot.create(:formazioni1_a, user_id: @player1.id,
                                            giornata: "1")
    end

    describe "New formazioni" do

        it "new has a 200 status code" do
            get :new
            expect(response.status).to eq(200)
        end
        it "render a list of soccer's players in the player's rose " do
            get :new
            expect(response).to render_template(:new)
        end
        it "insert soccer's player in formazioni from rose" do
            params = { id: @attaccante3.id }
            get :new, params: params
            expect(response).to redirect_to("/formazionis/new")
        end

        it "remove soccer's player from formazioni" do
            params = { id: @attaccante3.id }
            get :destroy, params: params
            expect(response).to redirect_to("/formazionis/new")
        end

    end

    describe "All formazioni" do

        it "index has a 200 status code" do
            get :index
            expect(response.status).to eq(200)
        end

        it "render all the league's players formazioni for current day " do
            get :index
            expect(response).to render_template(:index)
        end

        it "render all the league's players formazioni for a " do
            params = { id: 1 }
            get :index, params: params
            expect(response).to render_template(:index)
        end

    end

end
