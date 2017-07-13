class NotifyMailer < ApplicationMailer
  def new_apartment(house)
    @house = house
    mail(subject: 'New apartment!')
  end
end
