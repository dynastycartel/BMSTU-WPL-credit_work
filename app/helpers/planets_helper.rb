module PlanetsHelper
	def check_admin
		unless session[:user_id]
			flash[:warning] = 'У Вас нет прав на посещение этой страницы.'
			redirect_to home_path
			return
		end
		unless User.find(session[:user_id]).superuser
			flash[:warning] = 'У Вас нет прав на посещение этой страницы.'
			redirect_to home_path
			return
		end
	end
end
