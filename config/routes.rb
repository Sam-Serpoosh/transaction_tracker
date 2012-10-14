TransactionTracker::Application.routes.draw do
  resources :transactions, :only => [:index, :show, :new, :create, :edit, :update]

  get '/current_month_transactions',
    :to => "transactions#current_month_transactions",
    :as => "current_month_transactions"

  root :to => "transactions#index"
end
