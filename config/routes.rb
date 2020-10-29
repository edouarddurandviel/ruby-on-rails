Rails.application.routes.draw do

  # page router
  # index Posts
  root 'posts#index'
  resources :posts

  devise_for :users,
             path_names: {
                  sign_in: 'login',
                  sign_out: 'logout',
                  password: 'password',
                  confirmation: 'verification',
                  unlock: 'unblock',
                  registration: 'register',
                  sign_up: 'myself'
                },
            :controllers => {:resgistrations => "registrations"}

  devise_for :models



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
