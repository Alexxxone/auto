Auto::Application.routes.draw do
  resources :customers

  devise_for :users
  root to: 'customers#index'
  scope shallow_prefix: 'customers' do
    resources :customers do
      resources :payments
    end
  end
  post '/find_number_code' => 'customers#find_number_code'
end
