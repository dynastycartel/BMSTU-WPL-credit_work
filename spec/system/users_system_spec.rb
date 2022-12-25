require 'rails_helper'

RSpec.describe 'users', type: :system do
	scenario 'create a user' do
		visit '/users/new'

		fill_in 'email', with: 'dynasty_cartel@mail.ru'
		fill_in 'contact_name', with: 'Николай Васильев'
		fill_in 'password', with: '777'
		fill_in 'password_confirmation', with: '777'

		click_button 'Зарегистрироваться'

		expect(page).to have_text('Добро пожаловать, Николай Васильев!')
	end

	scenario 'passwords do not match case' do
		visit '/users/new'

		fill_in 'email', with: 'dynasty_cartel@mail.ru'
		fill_in 'contact_name', with: 'Николай Васильев'
		fill_in 'password', with: '777'
		fill_in 'password_confirmation', with: '888'

		click_button 'Зарегистрироваться'

		expect(page).to have_text('Пароли не совпадают')
	end

	scenario 'an unauthorized user cannot create planets' do
		visit '/planets/new'

		expect(page).to have_text('У Вас нет прав на посещение этой страницы.')
	end
end