Given ("I am authenticated president") do
    @president1=create(:president1)
    @league1=create(:league1, president_id: @president1.id)
    @president1.league_id=@league1.id
    @president1.save
    visit new_user_session_path
    fill_in "Email", :with => @president1.email
    fill_in "Password", :with => @president1.password
    click_button "Log in"
end

Given ("I am on the league home page") do
    page.has_content?("Home Page Lega")
    page.has_content?(@league1.name)
end

When /I click on "Calcola punteggi giornalieri"/ do
    click_on("Calcola punteggi giornalieri")
end

Given ("I am on the rate score page") do
    page.has_content?("Calcola i punteggi giornalieri dei giocatori")
    page.has_content?("Calcola i voti per la giornata"+@league1.current_day.to_s)
end

Given ("I filled the form") do
    fill_in "b"+@president1.id.to_s, :with => "6"
    fill_in "m"+@president1.id.to_s, :with => "4"
end

When /I click on "Salva cambiamenti"/ do
    click_on("Salva cambiamenti")
end

Then ("I should be on rate score page again") do
    page.has_content?("Calcola i punteggi giornalieri dei giocatori")
    page.has_content?("Calcola i voti per la giornata"+@league1.current_day.to_s)
end
