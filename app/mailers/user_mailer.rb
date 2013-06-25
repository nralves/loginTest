class UserMailer < ActionMailer::Base
  default from: "no-reply@conferencebuddy.com"
  
  def welcome_email(user, token)
    @user = user
    @url  = "http://example.com/login"
	@token = token
    mail(:to => user.email, :subject => "[no-reply]Welcome to Conference Buddy")
  end
end
