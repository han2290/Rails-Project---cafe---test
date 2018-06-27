Rails.application.routes.draw do

  #게시글 ID 필요
  post 'posts/:id/comments/create' => 'comments#create'
  
  #게시글 ID와 댓글의 ID 필요
  delete 'comments/:id' => 'comments#destroy'
  
  root 'cafes#index'
  resources :posts
  
  #cafe
  resources :cafes, except: [:destroy]
  post '/join_cafe/:cafe_id' => 'cafes#join_cafe' , as: 'join_cafe'
  
  
  #authenticate
  get     '/sign_up'    =>    'authenticate#sign_up'
  post    '/sign_up'    =>    'authenticate#user_sign_up'
  
  get     '/sign_in'    =>    'authenticate#sign_in'
  post    '/sign_in'    =>    'authenticate#user_sign_in'
  
  delete  '/sign_out'   =>    'authenticate#sign_out'
  
  get     '/user_info/:user_name'   =>    'authenticate#user_info'
  #-----end-----
  
end
