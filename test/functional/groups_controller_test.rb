require 'test_helper'

describe 'Groups integration' do
  it 'list groups' do
    login_user(create(:user, admin: true))
    group = create(:group)
    visit groups_path
    page.text.must_include group.name
    page.text.must_include group.description
  end

  it 'create groups' do
    login_user(create(:user, admin: true))
    visit new_group_path
    page.fill_in 'group_name', with: 'Nombre'
    page.fill_in 'group_subodmain', with: 'subdomain'
    page.fill_in 'group_description', with: 'Group description'
    click_submit

    user = User.last
    user.name.must_equal 'Nombre'
    user.subdomain.must_equal 'subdomain'
  end
end
