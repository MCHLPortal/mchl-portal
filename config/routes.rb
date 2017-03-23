Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/students/home' => 'students#home'
  get '/students/profile' => 'students#profile'
  get '/students/report_card' => 'students#report_card'
  get '/students/class' => 'students#my_class'
  get '/students/payments' => 'students#payments'

  get '/teachers/home' => 'teachers#home'
  get '/teachers/class' => 'teachers#show_class'
  post '/teachers/class/find' => 'teachers#find'
  get 'teachers/show_student_handled' => 'teachers#show_student_handled', :as => :show_student_handled
  get 'teachers/edit_report_card' => 'teachers#edit_report_card', :as => :edit_report_card
  patch 'teachers/update_report_card' => 'teachers#update_report_card', :as => :update_report_card

  get '/admin/home' => 'admins#home'
  get '/admin/students' => 'admins#students'
  get 'admins/new_student' => 'admins#new_student', :as => :new_student
  post '/students' => 'admins#create_student'
  post '/admin/students/find' => 'admins#find_student'
  get 'admins/show_student' => 'admins#show_student', :as => :show_student
  get 'admins/edit_student' => 'admins#edit_student', :as => :edit_student
  patch 'admins/update_student' => 'admins#update_student', :as => :update_student
  get '/admin/students/:id/delete' => 'admins#delete_student'

  get '/admin/students/:id/payments' => 'admins#payments'
  get 'admins/new_payment' => 'admins#new_payment', :as => :new_payment
  post 'payments' => 'admins#create_payment'
  get '/admin/students/:id/payments/:id/delete' => 'admins#delete_payment'

  get '/admin/teachers' => 'admins#teachers'
  get 'admins/show_teacher' => 'admins#show_teacher', :as => :show_teacher
  get 'admins/new_teacher' => 'admins#new_teacher', :as => :new_teacher
  post '/teachers' => 'admins#create_teacher'
  get 'admins/edit_teacher' => 'admins#edit_teacher', :as => :edit_teacher
  patch 'admins/update_teacher' => 'admins#update_teacher', :as => :update_teacher
  post '/admin/teachers/find' => 'admins#find_teacher'
  get '/admin/teachers/:id/delete' => 'admins#delete_teacher'

  get 'admin/sections' => 'admins#sections'
  get 'admins/show_section' => 'admins#show_section', :as => :show_section
  get 'admins/new_section' => 'admins#new_section', :as => :new_section
  post '/sections' => 'admins#create_section'
  get 'admins/edit_section' => 'admins#edit_section', :as => :edit_section
  patch 'admins/update_section' => 'admins#update_section', :as => :update_section
  post '/admin/sections/find' => 'admins#find_section'
  get '/admin/sections/:id/update' => 'admins#edit_section'
  get '/admin/sections/:id/delete' => 'admins#delete_section'
  
  get 'admin/assessments' => 'admins#assessments'
  get 'admins/edit_assessment' => 'admins#edit_assessment', :as => :edit_assessment
  patch 'admins/update_assessment' => 'admins#update_assessment', :as => :update_assessment
  
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
