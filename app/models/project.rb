class Project < ApplicationRecord
  has_many :todos
  validates_presence_of :title
end
