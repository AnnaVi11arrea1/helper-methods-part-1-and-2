Rails.application.routes.draw do
  root "movies#index" 
  resources:movies
  resources:directors
  # # Routes for the Movie resource:

  # # CREATE
  # post "/movies" =>  "movies#create", as: :movies
  # get "/movies/new" =>  "movies#new", as: :new_movie
          
  # # READ
  # get "/movies" =>  "movies#index" 
  # get "/movies/:id" =>  "movies#show", as: :movie
  
  # # UPDATE
  # patch "/movies/:id" =>  "movies#update"
  # get "/movies/:id/edit" =>  "movies#edit", as: :edit_movie
  
  # # DELETE
  # delete "/movies/:id" =>  "movies#destroy" 

  # #------------------------------

  # # Routes for the directors

  #   # CREATE
  #   post "/directors" =>  "directors#create", as: :directors
  #   get "/directors/new" =>  "directors#new", as: :new_director
            
  #   # READ
  #   get "/directors" =>  "directors#index" 
  #   get "/directors/:id" =>  "directors#show", as: :director
    
  #   # UPDATE
  #   patch "/directors/:id" =>  "directors#update"
  #   get "/directors/:id/edit" =>  "directors#edit", as: :edit_director
    
  #   # DELETE
  #   delete "/directors/:id" =>  "directors#destroy" 
  
    #------------------------------
end
