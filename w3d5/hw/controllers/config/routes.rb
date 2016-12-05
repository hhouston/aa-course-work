Rails.application.routes.draw do
  resources :books, only: [:index, :destroy, :new, :create]

  delete 'books/:id', to: 'books#destory'

end
