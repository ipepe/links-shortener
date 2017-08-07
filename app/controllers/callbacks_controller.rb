class CallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    remember_me @user
    sign_in_and_redirect @user
  end

  def facebook
    if request.env["omniauth.auth"].info.try(:email).present?
      @user = User.from_omniauth(request.env["omniauth.auth"])
      remember_me @user
      sign_in_and_redirect @user
    else
      redirect_to("/users/sign_in",
          flash: {alert: I18n.t('errors.messages.blank_email')})
    end
  end
end