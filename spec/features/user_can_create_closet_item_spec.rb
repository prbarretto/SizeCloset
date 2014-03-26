require 'spec_helper'

feature 'User can create a closet item' do
  background do
    @user = create(:user)
    sign_in_as(@user)
    visit '/'
  end

  scenario 'successfully' do
    click_link 'New Closet Item'
    fill_in('Store', with: 'Fancy Boutique')
    fill_in('Category', with: 'Dress')
    fill_in('Style', with: 'Long dress')
    fill_in('Size', with: '6')
    fill_in('Note', with: 'dry clean only')
    click_button 'Create Closet'
    click_link 'Home'

    expect(page).to have_content 'Fancy Boutique'
    expect(page).to have_content 'Dress'
    expect(page).to have_content 'Long dress'
    expect(page).to have_content '6'
    expect(page).to have_content 'dry clean only'
    expect(page).to_not have_content 'purple'
  end
end
