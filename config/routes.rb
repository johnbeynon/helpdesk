Helpdesk::Engine.routes.draw do
# Rails.application.routes.draw do
  scope "(:locale)", :locale => /pl|en/ do
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
      root :to => "tickets#index"
    end

    resources :faqs, :only => [ :index ]
    resources :tickets, :except => [ :edit, :destroy ]
    root :to => "faqs#index"

  end
end
