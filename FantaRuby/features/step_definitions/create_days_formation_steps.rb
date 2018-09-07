Given("I am on the new formation page") do
    @president1=create(:president1_a)
    @league1=create(:league1_a, president_id: @president1.id)
    @president1.league_id=@league1.id
    @president1.save
    @player1=create(:player1_a, league_id: @league1.id)
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
    @rose1=create(:rose1_a,     user_id: @player1.id,
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
    visit new_user_session_path
    fill_in "Email", :with => @player1.email
    fill_in "Password", :with => @player1.password
    click_button "Log in"
    visit new_formazioni_path
end

Given("I have a list of soccer's player in my rose") do
    expect(page).to have_text(@portiere1.cognome)
    expect(page).to have_text(@portiere2.cognome)
    expect(page).to have_text(@portiere3.cognome)
    expect(page).to have_text(@difensore1.cognome)
    expect(page).to have_text(@difensore2.cognome)
    expect(page).to have_text(@difensore3.cognome)
    expect(page).to have_text(@difensore4.cognome)
    expect(page).to have_text(@difensore5.cognome)
    expect(page).to have_text(@difensore6.cognome)
    expect(page).to have_text(@difensore7.cognome)
    expect(page).to have_text(@centrocampista1.cognome)
    expect(page).to have_text(@centrocampista2.cognome)
    expect(page).to have_text(@centrocampista3.cognome)
    expect(page).to have_text(@centrocampista4.cognome)
    expect(page).to have_text(@centrocampista5.cognome)
    expect(page).to have_text(@centrocampista6.cognome)
    expect(page).to have_text(@centrocampista7.cognome)
    expect(page).to have_text(@centrocampista8.cognome)
    expect(page).to have_text(@attaccante1.cognome)
    expect(page).to have_text(@attaccante2.cognome)
    expect(page).to have_text(@attaccante3.cognome)
    expect(page).to have_text(@attaccante4.cognome)
    expect(page).to have_text(@attaccante5.cognome)
    expect(page).to have_text(@attaccante6.cognome)
end

When("I click on soccer's player name") do
    click_on(@attaccante3.cognome)
    click_on(@portiere2.cognome)
    click_on(@centrocampista6.cognome)
    click_on(@portiere1.cognome)
end

Then("I should be on new formation page again") do
    expect(page).to have_text("Inserisci la formazione per la giornata "+ (@league1.votes_day+1).to_s)
end

Then("I have to see this soccer's player disappear from my rose's player list") do
    expect(page).to have_no_text(@portiere1.cognome+" portiere")
    expect(page).to have_no_text(@portiere2.cognome+" portiere")
    expect(page).to have_text(@portiere3.cognome+" portiere")
    expect(page).to have_text(@difensore1.cognome+" difensore")
    expect(page).to have_text(@difensore2.cognome+" difensore")
    expect(page).to have_text(@difensore3.cognome+" difensore")
    expect(page).to have_text(@difensore4.cognome+" difensore")
    expect(page).to have_text(@difensore5.cognome+" difensore")
    expect(page).to have_text(@difensore6.cognome+" difensore")
    expect(page).to have_text(@difensore7.cognome+" difensore")
    expect(page).to have_text(@centrocampista1.cognome+" centrocampista")
    expect(page).to have_text(@centrocampista2.cognome+" centrocampista")
    expect(page).to have_text(@centrocampista3.cognome+" centrocampista")
    expect(page).to have_text(@centrocampista4.cognome+" centrocampista")
    expect(page).to have_text(@centrocampista5.cognome+" centrocampista")
    expect(page).to have_no_text(@centrocampista6.cognome+" centrocampista")
    expect(page).to have_text(@centrocampista7.cognome+" centrocampista")
    expect(page).to have_text(@centrocampista8.cognome+" centrocampista")
    expect(page).to have_text(@attaccante1.cognome+" attaccante")
    expect(page).to have_text(@attaccante2.cognome+" attaccante")
    expect(page).to have_no_text(@attaccante3.cognome+" attaccante")
    expect(page).to have_text(@attaccante4.cognome+" attaccante")
    expect(page).to have_text(@attaccante5.cognome+" attaccante")
    expect(page).to have_text(@attaccante6.cognome+" attaccante")
end

Then("I have to see this soccer's player appear in the my formation's list") do
    expect(page).to have_text("Attaccante1 "+@attaccante3.cognome)
    expect(page).to have_text("Portiere "+@portiere2.cognome)
    expect(page).to have_text("Centrocampista1 "+@centrocampista6.cognome)
    expect(page).to have_text("Riserva portiere "+@portiere1.cognome)
end
