class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @all = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

end
