Given ("I am authenticated as president") do
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
    @punteggio = (  @portiere2.daily_score+@difensore3.daily_score+@difensore4.daily_score+@difensore7.daily_score+
                    @centrocampista4.daily_score+@centrocampista6.daily_score+@centrocampista8.daily_score+
                    @centrocampista2.daily_score+@attaccante3.daily_score+@attaccante1.daily_score+
                    @attaccante6.daily_score)
    visit new_user_session_path
    fill_in "Email", :with => @president1.email
    fill_in "Password", :with => @president1.password
    click_button "Log in"
end

Given ("I am on the league's home page") do
    expect(page).to have_text("Home Page Lega")
    expect(page).to have_text(@league1.name)
end

When /I click on "Impostazioni lega"/ do
    click_on("Impostazioni lega")
end

Given ("I am on the league's settings page") do
    expect(page).to have_text("Settings of " + @league1.name)
    @curr_status=@league1.status
end

Given ("I change league status") do
    if @curr_status == "Aperta"
        find('#radio[@value = "Chiusa"]').set(true)
    else
        find('#radio[@value = "Aperta"]').set(true)
    end
end

When /I click on "Salva cambiamenti" button/ do
    click_on("Salva cambiamenti")
end

Then ("I should be on league's settings page again") do
    @new_status = League.find_by(:name => "league1").status
    expect(page).to have_text("Settings of " + @league1.name)
end

Then("I have to see league status changed") do
    expect(@new_status).not_to eq(@curr_status)
end
