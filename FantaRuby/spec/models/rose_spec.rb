require "rails_helper"

describe Rose, :type => :model do
    it "Create rose" do
        @user=FactoryBot.create(:president1_a)
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

        @rose1=FactoryBot.create(:rose1_a,     user_id: @user.id,
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
        expect(@rose1).to be_valid
    end

    it "Create failure rose" do
        @user=FactoryBot.create(:president1_a)
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
        @rose1=Rose.new(
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
                            attaccante6: @attaccante6.id
                        )
        expect(@rose1).to_not be_valid
    end

    it "Verify associations" do
        user = User.new
        rose = Rose.new
        user.rose = rose
        expect(rose.user).to be user
    end
end
