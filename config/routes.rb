Rails.application.routes.draw do
  root 'example#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

end
