class Word < ActiveRecord::Base
  has_many :lesson_words, dependent: :destroy
  has_many :lessons, through: :lesson_words
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers,
    reject_if: lambda {|attribute| attribute[:content].blank?}, allow_destroy: true
end
