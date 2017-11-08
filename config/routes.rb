Rails.application.routes.draw do
  devise_for :users, :path => '',
                    :path_names=> {:sign_in=>"login", :sign_out=>"logout", :edit=>"profile"}


  root "pages#home"
  get'all' => "pages#all"

  resources :users, only: [:show]
  resources :books do
    resources :reservations, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
