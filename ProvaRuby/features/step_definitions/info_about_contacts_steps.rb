Given ("I am authenticated as Unregistered User") do
     visit new_user_session_path
end


When /I click on "contact"/ do
    click_link "contact"
end

Given ("I am on the contacts page") do
    expect(page).to have_text("Contact" )
end

Then ("I should see Contacts") do
    expect(page).to have_text("Contact")
    
end

