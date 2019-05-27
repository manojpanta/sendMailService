require 'sidekiq/web'
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/sendmail', to: 'sendmail#create'
      mount Sidekiq::Web => '/sidekiq'
    end
  end
end
