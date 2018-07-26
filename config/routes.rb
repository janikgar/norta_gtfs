Rails.application.routes.draw do
  root 'finder#index'
  get 'route' => 'finder#route'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
