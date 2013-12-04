class ChargeMailer < ActionMailer::Base
  default from: "me@Hammychap.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.charge_mailer.new_charge_notification.subject
  #
  def new_charge_notification charge, photo_id
    @charge = charge
    @photo_id = photo_id
    mail to: "hamchapman@gmail.com", subject: "You've received another payment!"
  end
end
