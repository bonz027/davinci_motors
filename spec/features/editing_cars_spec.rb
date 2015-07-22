require 'rails_helper'

feature 'Editing cars' do
  scenario 'can edit a car' do
    @car = Car.create(
      make: 'Toyota',
      model: 'Camry',
      year: '1984',
      price: '250.58'
    )

    visit '/'

    click_link 'Edit'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Update Car'

    expect(page).to have_content('1967 Ford Mustang has been updated.')

    within("#cars") do
      expect(page).to have_content('1967')
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('$2,300.00')
    end
  end
end
