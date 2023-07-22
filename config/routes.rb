Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :admin, only:[ :index, :show]
  resources :accounts do
    resources :records
  end
  get "/accounts/:id/edit_account_name", to: "accounts#edit_account_name", as: "edit_account_name"
  patch "/accounts/:id/updating_account_name", to: "accounts#updating_account_name", as: "updating_account_name"
  root "admin#index"
end
