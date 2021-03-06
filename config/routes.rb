Rails.application.routes.draw do

  devise_for :admins,:controllers => {:registrations => "admin/registrations"}

  root 'welcome#index'
  get 'my_portfolio', to: 'admins#my_portfolio'
  get 'my_portfolio2', to: 'admins#my_portfolio2'
  resources :add_students
  resources :my_subjects
  resources :student_subjects ,only:[:edit,:update,:show,:index]

  get 'student' , to: 'add_students#search'
  get 'subject' , to: 'my_subjects#search_subject'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

