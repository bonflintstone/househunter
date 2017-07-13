class House < ApplicationRecord
  validates :name, uniqueness: true

  after_create :notify

  private

  def notify
    NotifyMailer.new_apartment(self).deliver_now
  end
end
