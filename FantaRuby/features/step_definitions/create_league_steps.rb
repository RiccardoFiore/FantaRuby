Given ("I am a User") do
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

Given ("I am on the fantaruby page") do
    expect(page).to have_text("Cerca lega")
end
When /I click on "Crea lega" link/ do
    click_link "Crea lega"
end

Given ("I am on the crea nuova lega page") do
    expect(page).to have_text("Crea nuova lega")
end

Given ("I filled the lega form") do
    fill_in "Nome", :with => "nomelega"
    find_field('Numero massimo di giocatori').find('option[2]').text
    fill_in "Info di lega",:with => "nuova lega"
    
end

When /I click "Crea"/ do
    click_on("Crea")

end

Then ("I should be redirected to Crea rosa page") do
     expect(page).to have_text("Crea rosa")
    expect(page).to have_text(@player.username + ", budget: 300")
end

Then ("I should be a president") do
    me = User.find_by(:id => @player.id)
    expect(me.roles_mask).to eq(1)
end
