Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'calls/index', to: 'calls#index'

  post 'calls/handle', to: 'calls#handle'
  post 'calls/process_selection', to: 'calls#process_selection'
  post 'calls/update_details', to: 'calls#update_details'

  get 'calls/destroy', to: 'calls#destroy'

end
