class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :name,  presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}
end
