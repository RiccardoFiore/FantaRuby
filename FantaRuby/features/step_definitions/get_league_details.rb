Given ("I am authenticated as user") do
    @president1=create(:president1_a)
    @league1=create(:league1_a, president_id: @president1.id)
    @president1.league_id=@league1.id
    @president1.save
    @player=create(:player2_a)
    visit new_user_session_path
    fill_in "Email", :with => @player.email
    fill_in "Password", :with => @player.password
    click_button "Log in"
end

Given ("I am on the home page") do
    expect(page).to have_text("Cerca lega")
end

When /I click on "Details"/ do
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
