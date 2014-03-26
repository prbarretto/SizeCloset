require 'spec_helper'

feature 'User can edit a closet item' do
  background do
    @user = create(:user)
    sign_in_as(@user)
    visit '/'
  end

  scenario 'successfully' do
    click_link 'New Closet Item'
    fill_in('Store', with: 'JeanBrandX')
    fill_in('Category', with: 'Jeans')
    fill_in('Style', with: 'Bootcut')
    fill_in('Note', with: 'best sales for jeans in July')
    click_button 'Create Closet'
    click_link 'Home'
    click_link 'Edit'
    fill_in('Size', with: '27')
    click_button 'Update Closet'
    click_link 'Home'

    expect(page).to have_content 'JeanBrandX'
    expect(page).to have_content 'Jeans'
    expect(page).to have_content 'Bootcut'
    expect(page).to have_content '27'
    expect(page).to have_content 'best sales for jeans in July'
    expect(page).to_not have_content 'yoyo muffins'
  end
end
