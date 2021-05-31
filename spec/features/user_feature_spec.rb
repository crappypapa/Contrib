require 'rails_helper'

feature 'Accessing Application' do
  background do
    User.create(username: 'Olaoluwa')
    Group.create(name: 'Vibes', author_id: 1)
    Contribution.create(name: 'Drinks', amount: 500, author_id: 1)
    Contribution.create(name: 'Food', amount: 2000, author_id: 1)
    ContributionGroup.create(contribution_id: 1, group_id: 1)
  end

  scenario 'Sign in in with correct credentials' do
    visit '/login'
    fill_in 'Username', with: 'Olaoluwa'
    click_button 'Log in'
    expect(page).to have_content 'Successfully logged in.'
    expect(page).to have_current_path(root_path)
    expect(page).to_not have_current_path('/login')
  end

  scenario "User can't Sign in with wrong credentials" do
    visit '/login'
    fill_in 'Username', with: 'olaaaluwa'
    click_button 'Log in'
    expect(page).to have_content 'Error logging in.'
    expect(page).to have_current_path('/login')
    expect(page).to_not have_current_path(root_path)
  end
end

feature 'Navigation through the application pages' do
  background do
    User.create(username: 'Olaoluwa')
    Group.create(name: 'Vibes', author_id: 1)
    Contribution.create(name: 'Drinks', amount: 500, author_id: 1)
    Contribution.create(name: 'Food', amount: 2000, author_id: 1)
    ContributionGroup.create(contribution_id: 1, group_id: 1)
  end

  scenario 'user is presented with a Landing page' do
    visit '/login'
    fill_in 'Username', with: 'Olaoluwa'
    click_button 'Log in'
    
    expect(page).to have_content 'Contributions'
    expect(page).to have_content 'Ungrouped Contributions'
    expect(page).to have_content 'Contribution Groups'
    expect(page).to_not have_content 'log In'
    expect(page).to_not have_content 'Sign Up'
  end

  scenario 'user opens Ungrouped Contributions page' do
    visit '/login'
    fill_in 'Username', with: 'Olaoluwa'
    click_button 'Log in'
    click_link 'Ungrouped Contributions'
    expect(page).to have_content '2000'
    expect(page).to have_content 'Food'
    expect(page).to have_content 'Add Contribution'
    expect(page).to_not have_current_path('/login')
  end
end

feature 'Adding New groups and contributions' do
  background do
    User.create(username: 'Olaoluwa')
  end

  scenario 'user opens New Group page' do
    visit '/login'
    fill_in 'Username', with: 'Olaoluwa'
    click_button 'Log in'
    click_link 'Contribution Groups'
    click_link 'Add Group'
    expect(page).to have_current_path('/groups/new')
    expect(page).to have_content 'Create Contribution Group'
    click_button 'Create Group'
    expect(page).to_not have_current_path('/login')
    expect(page).to have_current_path('/groups')
  end

  scenario 'user opens Contribution page' do
    visit '/login'
    fill_in 'Username', with: 'Olaoluwa'
    click_button 'Log in'
    click_link 'Contributions'
    click_link 'Add Contribution'
    expect(page).to have_current_path('/contributions/new')
    expect(page).to have_content 'Create Contribution'
    click_button 'Add new contribution'
    expect(page).to have_current_path('/contributions')
    expect(page).to_not have_current_path('/login')
  end
end
