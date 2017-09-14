Rails.application.routes.draw do
  devise_for :users
  get '/superadmins/delmod'
  get '/moderators/delsale'
  get '/superadmins/assign'
  get '/moderators/assign'
  get '/moderators/approve'
  get '/moderators/reject'
  get '/moderators/remove'
  get '/sales/newShop'
  post '/sales/newShop'
  get '/sales/remove'
  get '/sales/edit'
  get '/customers/comment'
  get '/customers/search'
  post '/customers/search'
  get '/customers/commented'
  post '/customers/commented'
  get '/customers/reply'
  post '/customers/reply'
  post '/sales/edit'
  resources :moderators
  resources :superadmins
  resources :sales
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
     root to: 'devise/sessions#new'
  end
end
