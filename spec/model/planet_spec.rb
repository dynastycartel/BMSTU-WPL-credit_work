require 'rails_helper'

RSpec.describe Planet, type: :model do
	describe 'validations' do

    file = Rails.root.join('app', 'assets', 'images', 'earth.jpg')
    image = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file, 'rb'),
      filename: 'earth.jpg',
      content_type: 'image/jpg'
    )

    let!(:main_planet_data) do
      {planet_name: 'SpecTest', picture: image, nearest_star_name: 'SpecTest',
      distance_in_ly: 100, free_space: 100}
    end

    let!(:planet_repeat_name_data) do
      {planet_name: 'SpecTest', picture: image, nearest_star_name: 'SpecTest',
      distance_in_ly: 200, free_space: 150}
    end

    let!(:main_planet) { Planet.create(main_planet_data) }
    let!(:planet_repeat_name) { Planet.create(planet_repeat_name_data) }

    it 'a planet with a unique name is valid' do
      expect(main_planet.valid?).to eq(true)
    end

    it 'a planet with an already existing name is invalid' do
      expect(planet_repeat_name.valid?).to eq(false)
    end

		it { should validate_presence_of(:planet_name).with_message('не может быть пустым') }
    it { should validate_presence_of(:picture).with_message('не может быть пустым') }
    it { should validate_presence_of(:nearest_star_name).with_message('не может быть пустым') }
    it { should validate_presence_of(:distance_in_ly).with_message('не может быть пустым') }
    it { should validate_presence_of(:free_space).with_message('не может быть пустым') }

    context 'invalid free_space case' do
    	it { should_not allow_value(Faker::Lorem.word).for(:free_space) }
    end

    context 'invalid distance_in_ly case' do
    	it { should_not allow_value(Faker::Lorem.word).for(:distance_in_ly) }
    end

    context 'valid description case' do
      it { should allow_value(Faker::Lorem.paragraph).for(:description) }
    end
	end
end