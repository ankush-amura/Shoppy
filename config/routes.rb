Rails.application.routes.draw do
  devise_for :users

  resources :moderators do
    collection do
      get 'delsale'
      get 'assign'
      get 'approve'
      get 'reject'
      get 'remove'
      get 'shops'
      get 'search'
    end
  end

  resources :superadmins do
    collection do
      get 'delmod'
    end
    end

  resources :sales do
    collection do
      get  'newShop'
      post 'newShop'
      get  'remove'
      get  'edit'
      post 'edit'
    end
  end

  resources :customers do
    collection do
      get  'comment'
      get  'search'
      post 'search'
      get  'commented'
      post 'commented'
      get  'reply'
      post 'reply'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
     root to: 'devise/sessions#new'
  end
end
