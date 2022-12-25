require 'rails_helper'
require 'spec_helper'
#require_relative '../support/spec_test_helper'

RSpec.describe 'desired_planets', type: :system do

	file = Rails.root.join('app', 'assets', 'images', 'earth.jpg')
  image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(file, 'rb'),
    filename: 'earth.jpg',
    content_type: 'image/jpg'
  )

  let!(:test_planet_data) do
		{planet_name: 'SpecTest', picture: image, nearest_star_name: 'SpecTest',
			distance_in_ly: 150, free_space: 100}
	end

	let!(:test_planet) { Planet.create(test_planet_data) }

	let!(:test_user) { User.create(email: 'dynasty_cartel@mail.ru', contact_name: 'Иван Иванов',
		password: '999') }

	scenario 'an unauthorized user can check planet info' do
		visit home_path
		click_button 'Подробнее'
		expect(page).to have_text('SpecTest')
	end

	scenario 'an unauthorized user cannot add a desired planet' do
		visit home_path
		click_button 'Подробнее'
		expect(page).to have_text('Чтобы отметиться, что Вы хотите посетить эту планету, вам необходимо войти в аккаунт.')
	end
end