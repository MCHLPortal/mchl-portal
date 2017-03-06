Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/students/home' => 'students#home'
  get '/students/profile' => 'students#profile'
  get '/students/report_card' => 'students#report_card'
  get '/students/report_card_gmd' => 'students#report_card_gmd'
  get '/students/report_card_fmd' => 'students#report_card_fmd'
  get '/students/report_card_shd' => 'students#report_card_shd'
  get '/students/report_card_rld' => 'students#report_card_rld'
  get '/students/report_card_eld' => 'students#report_card_eld'
  get '/students/report_card_cd' => 'students#report_card_cd'
  get '/students/report_card_sed' => 'students#report_card_sed'
  get '/students/class' => 'students#my_class'
  get '/students/payments' => 'students#payments'

  get '/teachers/home' => 'teachers#home'
  get '/teachers/class' => 'teachers#show_class'
  post '/teachers/class/find' => 'teachers#find'
  get '/teachers/class/student/:id' => 'teachers#show_student'

  get '/admin/home' => 'admins#home'
  get '/admin/students' => 'admins#students'
  get '/admin/students/new' => 'admins#new_student'
  post '/students' => 'admins#create_student'
  post '/admin/students/find' => 'admins#find_student'
  get '/admin/students/:id' => 'admins#show_student'
  get '/admin/students/:id/update' => 'admins#edit_student'
  patch '/admin/students/:id/update' => 'admins#update_student'
  get '/admin/students/:id/delete' => 'admins#delete_student'

  get '/admin/teachers' => 'admins#teachers'
  get '/admin/teachers/new' => 'admins#new_teacher'
  post '/teachers' => 'admins#create_teacher'
  post '/admin/teachers/find' => 'admins#find_teacher'
  get '/admin/teachers/:id' => 'admins#show_teacher'
  get '/admin/teachers/:id/update' => 'admins#edit_teacher'
  patch '/admin/teachers/:id/update' => 'admins#update_teacher'
  get '/admin/teachers/:id/delete' => 'admins#delete_teacher'

  get 'admin/sections' => 'admins#sections'
  get 'admin/sections/new' => 'admins#new_section'
  post 'sections' => 'admins#create_section'
  post '/admin/sections/find' => 'admins#find_section'
  get '/admin/sections/:id' => 'admins#show_section'
  get '/admin/sections/:id/update' => 'admins#edit_section'
  patch '/admin/sections/:id/update' => 'admins#update_section'
  get '/admin/sections/:id/delete' => 'admins#delete_section'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
