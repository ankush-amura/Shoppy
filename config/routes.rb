Rails.application.routes.draw do
  devise_for :users
  get '/superadmins/delmod'
  get '/moderators/delsale'
  resources :moderators
  resources :superadmins
  resources :sales
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
