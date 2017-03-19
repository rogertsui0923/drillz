class UsersMailer < ApplicationMailer
  def notify_user_sign_up(user)
    @user = user
    @admins = User.where(is_admin: true)

    @admins.each do |admin|
      mail(to: admin.email, subject: "New User wants to sign up")
    end
  end
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
