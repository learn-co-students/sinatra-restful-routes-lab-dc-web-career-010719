class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_method, true
  end

  # code actions here!

  get "/" do
    redirect "/recipes"
  end

  get "/recipes" do
    @all_recipe = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :recipe_new
  end

  post "/recipes" do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end

  patch "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  delete "/recipes/:id" do
    Recipe.delete(params[:id])
    redirect "/recipes"
  end

end
