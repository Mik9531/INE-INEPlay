require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
    
test 'password_reset_instructions' do
@user = User.create(:name => 'George Jackson',
:login => 'George',
:email => 'ineplay@outlook.es',
:password => '123456Ine',
:password_confirmation => '123456Ine')
mail = NotifierMailer.password_reset_instructions(@user)
assert_equal 'Password reset instructions', mail.subject
assert_equal ['ineplay@outlook.es'], mail.to
assert_equal 'INEPlay Notifier', mail.from
assert_match "Dear #{@user.name}:", mail.body.encoded
@edit_password_reset_url =
"http://localhost:3000/password_reset/edit?id=#{@user.perishable_token}"
@link =
"<a href=\"#{@edit_password_reset_url}\">#{@edit_password_reset_url}"
# assert_match @link, mail.body.encoded
end
end
