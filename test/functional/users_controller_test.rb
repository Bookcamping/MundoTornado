require 'test_helper'

describe 'Users integration' do
  it 'creates new users' do
    visit new_user_path
    fill_in 'user_email', with: 'email@example.com'
    fill_in 'user_name', with: 'Some name'
    fill_in 'user_password', with: 'secret'
    fill_in 'user_password_confirmation', with: 'secret'
    click_submit

    user = User.last
    user.email.must_equal 'email@example.com'
    user.name.must_equal 'Some name'
    user.slug.must_equal 'some-name'

  end
end
