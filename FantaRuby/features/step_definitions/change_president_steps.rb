Given ("I am authenticated as Admin") do

    @admin= create(:admin)
    @admin.save

    @president1=create(:president1_a)
    @league1=create(:league1_a, president_id: @president1.id)
    @president1.league_id=@league1.id
    @president1.save

    @player=create(:player1_a)
    @player.league_id=@league1.id
    @player.save


    @portiere1=create(:s_p_p1)
    @portiere2=create(:s_p_p2)
    @portiere3=create(:s_p_p3)
    @difensore1=create(:s_p_d1)
    @difensore2=create(:s_p_d2)
    @difensore3=create(:s_p_d3)
    @difensore4=create(:s_p_d4)
    @difensore5=create(:s_p_d5)
    @difensore6=create(:s_p_d6)
    @difensore7=create(:s_p_d7)
    @centrocampista1=create(:s_p_c1)
    @centrocampista2=create(:s_p_c2)
    @centrocampista3=create(:s_p_c3)
    @centrocampista4=create(:s_p_c4)
    @centrocampista5=create(:s_p_c5)
    @centrocampista6=create(:s_p_c6)
    @centrocampista7=create(:s_p_c7)
    @centrocampista8=create(:s_p_c8)
    @attaccante1=create(:s_p_a1)
    @attaccante2=create(:s_p_a2)
    @attaccante3=create(:s_p_a3)
    @attaccante4=create(:s_p_a4)
    @attaccante5=create(:s_p_a5)
    @attaccante6=create(:s_p_a6)
    @rose1=create(:rose1_a,     user_id: @president1.id,
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
    @formazioni1=create(:formazioni1_a, user_id: @president1.id,
                                        giornata: "1",
                                        portiere: @rose1.portiere2,
                                        difensore1: @rose1.difensore3,
                                        difensore2: @rose1.difensore4,
                                        difensore3: @rose1.difensore7,
                                        centrocampista1: @rose1.centrocampista4,
                                        centrocampista2: @rose1.centrocampista6,
                                        centrocampista3: @rose1.centrocampista8,
                                        centrocampista4: @rose1.centrocampista2,
                                        attaccante1: @rose1.attaccante3,
                                        attaccante2: @rose1.attaccante1,
                                        attaccante3: @rose1.attaccante6,
                                        riservapor: @rose1.portiere1,
                                        riservadif: @rose1.difensore6,
                                        riservacen: @rose1.centrocampista1,
                                        riservaatt: @rose1.attaccante2 )

    visit new_user_session_path
    fill_in "Email", :with => @admin.email
    fill_in "Password", :with => @admin.password
    click_button "Log in"
    visit admins_delete_users_path
end


Given ("I am on the settings page") do
    expect(page).to have_text("Cerca User")
end


When /I click on "Change President" link/ do
    click_link("Change President", :match => :first)
    visit edit_league_path(@league1.id)
end


Then ("I should be on edit page of league") do
    expect(page).to have_text("Settings of")
end


When /I click on "Salva Cambiamenti"/ do
    click_button "Salva cambiamenti"
    @league1.update_attributes!(:president_id => @player.id)
    @player.update_attributes!(:roles_mask => 2)
    @president1.update_attributes!(:roles_mask => 4)
end

Then ("the president should be changed") do
    new_president = User.find_by(:id => @player.id)
    expect(@league1.president_id).to eq(new_president.id)
end
