Helpdesk::Engine.routes.draw do
    root :to => "dashboard#index"
    namespace :admin do
        root :to => "dashboard#index"
    end
end
