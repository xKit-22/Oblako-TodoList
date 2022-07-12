class Todo < ApplicationRecord
  belongs_to :project
  validates_presence_of :text
end
