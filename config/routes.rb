Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :transactions, :except => [:update, :destroy]
  devise_for :users, controllers: {sessions: :sessions}, defaults: {format: :json}, path_names: {sign_in: :login, sign_out: :logout}
  resources :users

end
