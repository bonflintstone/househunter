class House < ApplicationRecord
  DOMAIN = 'https://www.rochdale.nl'

  validates :name, uniqueness: true

  after_create :notify

  def full_link
    DOMAIN + link
  end

  private

  def notify
    NotifyMailer.new_apartment(self).deliver_now
  end
end
