TransactionTracker::Application.routes.draw do
  resources :transactions, :only => [:index, :show, :new, :create]

  root :to => "transactions#index"
end
