require 'test_helper'

class AutomailerTest < ActionMailer::TestCase
  test "sendmail" do
    @expected.subject = 'Automailer#sendmail'
    @expected.body    = read_fixture('sendmail')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Automailer.create_sendmail(@expected.date).encoded
  end

end
