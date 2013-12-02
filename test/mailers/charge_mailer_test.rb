require 'test_helper'

class ChargeMailerTest < ActionMailer::TestCase
  test "new_charge_notification" do
    mail = ChargeMailer.new_charge_notification
    assert_equal "New charge notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
