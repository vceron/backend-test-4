Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'calls/index', to: 'calls#index'

  # for Twilio webhooks
  post 'calls/handle', to: 'calls#handle'
  post 'calls/process_selection', to: 'calls#process_selection', as: :selection
  post 'calls/process_dial', to: 'calls#process_dial', as: :dial
  post 'calls/process_record', to: 'calls#process_record', as: :record
  post 'calls/update_details', to: 'calls#update_details'

  get 'calls/destroy', to: 'calls#destroy'

end
