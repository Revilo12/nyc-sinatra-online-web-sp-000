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
    if !@landmark_name.empty?
      if !(landmark = Landmark.fing_by(name: @landmark_name))
        landmark = Landmark.create(name: @landmark_name)
      end
      @figure.landmarks << landmark
    end
    if !@landmark_name.empty?
      if !(landmark = Landmark.fing_by(name: @landmark_name))
        landmark = Landmark.create(name: @landmark_name)
      end
      @figure.landmarks << landmark
    end
    @figure.save
    redirect '/figures/#{@figure.id}'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit'
    @figure = Figure.find(params[:id])
  end

  patch '/figures/:id/' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @landmark_name = params[:landmark][:name]
    @title_name = params[:title][:name]
    if !@landmark_name.empty?
      if !(landmark = Landmark.fing_by(name: @landmark_name))
        landmark = Landmark.create(name: @landmark_name)
      end
      @figure.landmarks << landmark
    end
    if !@landmark_name.empty?
      if !(landmark = Landmark.fing_by(name: @landmark_name))
        landmark = Landmark.create(name: @landmark_name)
      end
      @figure.landmarks << landmark
    end
    @figure.save
    redirect '/figures/#{@figure.id}'
  end

end
