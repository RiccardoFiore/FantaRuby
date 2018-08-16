Given ("I am authenticated as a user") do
    @president1=create(:president1_a)
    @league1=create(:league1_a, president_id: @president1.id)
    @president1.league_id=@league1.id
    @president1.save


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



    @player=create(:player2_a)
    visit new_user_session_path
    fill_in "Email", :with => @player.email
    fill_in "Password", :with => @player.password
    click_button "Log in"
end

Given ("I am on the app's home page") do
    expect(page).to have_text("Cerca lega")
end

When /I click on "Details" link/ do
    click_link "Details"
end

Given ("I am on the league's details page") do
    expect(page).to have_text("Details about " + @league1.name)
end

Then ("I should see league's details") do
    expect(page).to have_text("Status lega " + @league1.status)
    expect(page).to have_text("Montepremi:")
    expect(page).to have_text(@president1.email)
    expect(@league1.users).not_to eq(nil)
end

When /I click on "Partecipa"/ do
    click_button "Partecipa"
end

Then ("I should be on create rose page") do
    expect(page).to have_text("Crea rosa")
    expect(page).to have_text(@player.username + ", budget: 300")
end

Given ("I have list of all soccer player and I choose 24 players") do
    click_link @portiere1.cognome
    click_link @portiere2.cognome
    click_link @portiere3.cognome
    find('#role').find(:xpath, "option[2]").select_option
    click_button "Filtra"
    click_link @difensore1.cognome
    click_link @difensore2.cognome
    click_link @difensore3.cognome
    click_link @difensore4.cognome
    click_link @difensore5.cognome
    click_link @difensore6.cognome
    click_link @difensore7.cognome
    find('#role').find(:xpath, "option[3]").select_option
    click_button "Filtra"
    click_link @centrocampista1.cognome
    click_link @centrocampista2.cognome
    click_link @centrocampista3.cognome
    click_link @centrocampista4.cognome
    click_link @centrocampista5.cognome
    click_link @centrocampista6.cognome
    click_link @centrocampista7.cognome
    click_link @centrocampista8.cognome
    find('#role').find(:xpath, "option[4]").select_option
    click_button "Filtra"
    click_link @attaccante1.cognome
    click_link @attaccante2.cognome
    click_link @attaccante3.cognome
    click_link @attaccante4.cognome
    click_link @attaccante5.cognome
    click_link @attaccante6.cognome
end


When /I click on "Salva rosa"/ do
    click_button "Salva rosa"
end


Then ("I should be redirected to league's home page") do
    expect(page).to have_text("Home Page Lega")
    expect(page).to have_text(@league1.name)
end

Then ("I should be a player") do
    me = User.find_by(:id => @player.id)
    expect(me.roles_mask).to eq(4)
end
