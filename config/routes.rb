Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'calls/index', to: 'calls#index'

  post 'calls/welcome', to: 'calls#handle'

  get 'calls/destroy', to: 'calls#destroy'

end
