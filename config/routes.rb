Rails.application.routes.draw do
  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through
  get 'notifications', to: 'notifications#index'
  get 'profiles/show'
  get 'posts/:id/chat', to: 'posts#chat', as: 'post_chat'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'
  
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  #devise_for :users
  #devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
  	resources :comments
  	#member do 
  	#	get :destroy_1
  	#end
    member do
      get 'like'
    end
 end  #de esta forma agregando solo la ruta raiz me manda a rails si le pongo /posts me manda al photogram

 
end
