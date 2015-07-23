require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang has been created.')

    within("#cars") do
      expect(page).to have_content('1967')
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('$2,300.00')
    end
  end

  scenario 'can create a second car' do
    @car = Car.create(
      make: 'Toyota',
      model: 'Camry',
      year: '1984',
      price: '250.58'
    )
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang has been created.')

    within("#cars") do
      expect(page).to have_content('1967')
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('$2,300.00')

      expect(page).to have_content(@car.year)
      expect(page).to have_content(@car.make)
      expect(page).to have_content(@car.model)
      expect(page).to have_content(@car.price)
    end
  end
end
