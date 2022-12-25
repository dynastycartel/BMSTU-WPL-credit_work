require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'validations' do

		let!(:user_data) do
			{email: 'dynasty_cartel@mail.ru', contact_name: 'Амогус Абобус', password: '999'}
		end

		let!(:user_data_repeat_email) do
			{email: 'dynasty_cartel@mail.ru', contact_name: 'Абобус Амогус', password: '777'}
		end

		let!(:main_user) { User.create(user_data) }
		let!(:user_repeat_email) { User.create(user_data_repeat_email) }

		it 'a user with unique email is valid' do
			expect(main_user.valid?).to eq(true)
		end

		it 'a user with already existing email is invalid' do
			expect(user_repeat_email.valid?).to eq(false)
		end

		it { should validate_presence_of(:email).with_message('не может быть пустым') }
    it { should validate_presence_of(:contact_name).with_message('не может быть пустым') }
    it { should validate_presence_of(:password).with_message('не может быть пустым') }

    context 'invalid email case' do
    	it { should_not allow_value(Faker::Lorem.word).for(:email) }
    end

    context 'valid email case' do
    	it { should allow_value(Faker::Internet.email).for(:email) }
    end

    context 'invalid contact_name case' do
    	it { should_not allow_value('Никол4й Васильев').for(:contact_name) }
    end

    context 'valid contact_name case' do
    	it { should allow_value('Николай Васильев').for(:contact_name) }
    end
	end
end