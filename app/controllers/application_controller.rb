class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect to '/index'
  end

  get '/index' do
    @recipes = Recipe.all
    erb :index
  end

  get '/new' do

    erb :new

  end

  get '/recipes' do

    redirect to "/index"
  end

  post '/recipes' do

    @recipe = Recipe.create(params)

    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do

    @recipe = Recipe.find(params[:id])
    erb :edit

  end

  get '/recipes/:id' do

    @recipe = Recipe.find(params[:id])

    erb :show
  end

  patch '/recipes/:id' do

    @recipe = Recipe.find(params[:id])
    @recipe.update({name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time]})

    redirect to "/recipes/#{@recipe.id}"

  end

  delete '/recipes/:id' do

    Recipe.destroy(params[:id])
    redirect to '/index'

  end



end
