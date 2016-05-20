class Word < ActiveRecord::Base
  has_many :lesson_words, dependent: :destroy
  has_many :lessons, through: :lesson_words
  has_many :answers
end
