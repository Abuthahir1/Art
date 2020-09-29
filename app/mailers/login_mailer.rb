class LoginMailer < ApplicationMailer

	def send_email(user,url)
		@user = user
		@url = url

		mail to:@user.email, subject: 'Sign in into mywebsite.com'
	end
end