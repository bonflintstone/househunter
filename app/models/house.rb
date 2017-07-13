class House < ApplicationRecord
  validates :name, uniqueness: true

  after_create :check_house

  private

  def check_house
    CheckJob.new(houe).perform
  end
end
