class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @all = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @landmark_name = params[:landmark][:name]
    @title_name = params[:title][:name]
    if !params[:landmark][:name].empty?
      if landmark = Landmark.fing_by(name: pa)

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end



end
