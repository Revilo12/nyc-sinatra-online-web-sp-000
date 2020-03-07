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
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  def helpers
    def check_set_input_name(instance, input_name, input_class)
      if !@landmark_name.empty?
        if !(assigned_instance = send("#{input_class}.find_by(name: #{input_name})")
          assigned_instance = send("#{input_class}.create(name: #{input_name})")
        end
        send("#{input_class}.#{input_class.name.downcase}") << assigned_instance
      end
    end
  end

end
