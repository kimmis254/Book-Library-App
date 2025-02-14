Rails.application.routes.draw do
  root "books#index"

  resources :books do
    member do
      post 'borrow'
      post 'return'
    end
  end

  get 'borrowers/:borrower_name', to: 'borrowings#show', as: 'borrower_history'
  get 'borrowings/history/:borrower_name', to: 'borrowings#history', as: 'borrower_lending_history'

end
