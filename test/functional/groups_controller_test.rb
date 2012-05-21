require 'test_helper'

describe 'Groups integration' do
  it 'list groups' do
    login_user(create(:user, admin: true))
    group = create(:group)
    visit groups_path
    page.text.must_include group.name
    page.text.must_include group.description
  end
end
