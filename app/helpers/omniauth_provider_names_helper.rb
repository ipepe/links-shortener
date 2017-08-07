module OmniauthProviderNamesHelper
  def omniauth_name(provider)
    if provider == :google_oauth2
      :google
    else
      provider
    end
  end
end