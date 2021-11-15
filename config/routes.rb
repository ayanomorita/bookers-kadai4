Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
 resources :users
 resources :books do
   resources :book_comments
   resource :favorites
 end
end

