class Figure < ActiveRecord::Base
  # add relationships here
  has_many :figure_titles
  has_many :title, through: :figure_titles
  has_many :landmarks
end
