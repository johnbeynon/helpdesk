Helpdesk::Engine.routes.draw do
  require 'route_constraints_faqs'
  require 'route_constraints_tickets'
  # Rails.application.routes.draw do
  scope "(:locale)", :locale => /pl|pt|en/ do
    # Admin only roots
    namespace :admin do
      resources :tickets do
        get :assign, on: :member
      end
      resources :ticket_types
      resources :faqs do
        post :sort, on: :collection
      end
      resources :subscribers
      root :to => 'tickets#index'
    end

    resources :subscribers, :only => [:index, :create, :destroy]
    resources :faqs, :only => [ :index ]
    resources :tickets, :except => [ :edit, :destroy ]


    root :to => 'rooter#index'

  end
end
