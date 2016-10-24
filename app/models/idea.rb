class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :thought, class_name: "Idea", optional: true, dependent: :destroy
  has_many :likes, dependent: :destroy
end
