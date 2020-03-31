Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resource :volunteers do
    get 'signup'
  end

  get '/api/reports', action: 'reports', controller: 'api'
  get '/api/kerala/summary', action: 'kerala_summary', controller: 'api'
  get '/api/kerala/all', action: 'all_stats', controller: 'api'
  get '/api/kerala/summary/all', action: 'kerala_summary_all', controller: 'api'

  get '/data_scientist', action: 'data_scientist', controller: 'home'
  get '/engineer', action: 'engineer', controller: 'home'
  get '/medical', action: 'medical', controller: 'home'
  get '/core', action: 'core', controller: 'home'

  get '/punjab', action: 'index', controller: 'punjab'
  get '/punjab/engineer', action: 'engineer', controller: 'home'
end
