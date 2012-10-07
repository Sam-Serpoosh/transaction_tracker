TransactionTracker::Application.routes.draw do
  resources :transactions, :only => [:index, :show, :new, :create, :edit, :update]

  root :to => "transactions#index"
end
