Rails.application.routes.draw do
  devise_for :users, :path => '',
                    :path_names=> {:sign_in=>"login", :sign_out=>"logout", :edit=>"profil"}


  root "pages#home"
  get'all' => "pages#all"
  get '/preload' => "reservations#preload"
  get '/preview' => "reservations#preview"
  get '/mes_emprunts' => "reservations#vos_emprunts"
  get '/mes_reservations' => "reservations#mes_reservations"

  resources :users, only: [:show]
  resources :books, path: "livres" do
    resources :reservations, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
