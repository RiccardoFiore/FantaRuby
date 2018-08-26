Given ("I am authenticated as Unregistered User") do
     visit new_user_session_path
end


When /I click on "Contact"/ do
    click_link "Contatti"
end

Given ("I am on the contacts page") do
    expect(page).to have_text("Contatti" )
end

Then ("I should see Contacts") do
    expect(page).to have_text("Contatti")

end

