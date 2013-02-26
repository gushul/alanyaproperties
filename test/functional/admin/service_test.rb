require 'test_helper'

class Admin::ServiceTest < ActionMailer::TestCase
  test "transfer" do
    mail = Admin::Service.transfer
    assert_equal "Transfer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "contacts" do
    mail = Admin::Service.contacts
    assert_equal "Contacts", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order" do
    mail = Admin::Service.order
    assert_equal "Order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
