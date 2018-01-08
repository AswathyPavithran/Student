Rails.application.routes.draw do

  devise_for :admins,:controllers => {:registrations => "admin/registrations"}

  root 'welcome#index'
  get 'my_portfolio', to: 'admins#my_portfolio'
  resources :add_students
  resources :my_subjects
  resources :student_subjects ,only:[:edit,:update,:show,:index]

  get 'student' , to: 'add_students#search'


 

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
