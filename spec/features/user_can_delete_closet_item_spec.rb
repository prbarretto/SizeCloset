require 'spec_helper'

feature 'User can delete a closet item' do
  background do
    @user = create(:user)
    sign_in_as(@user)
    visit '/'
  end

  scenario 'successfully' do
    click_link 'New Closet Item'
    fill_in('Store', with: 'CoolShoes')
    fill_in('Category', with: 'Shoes')
    fill_in('Style', with: 'Sneakers')
    fill_in('Size', with: '7.5')
    fill_in('Note', with: 'best salesperson is Chris')
    click_button 'Create Closet'
    click_link 'Home'
    click_link 'Delete'

    expect(page).to_not have_content 'CoolShoes'
    expect(page).to_not have_content 'Shoes'
    expect(page).to_not have_content 'Sneakers'
    expect(page).to_not have_content '7.5'
    expect(page).to_not have_content 'best salesperson is Chris'
  end
end
