require 'test_helper'

describe 'Seeds integration' do
  it 'list seeds' do
    seed = create(:seed, group: current_group)

    visit seeds_path
    page.text.must_include seed.body
  end

  it 'can create seeds if logged in' do
    login_user(create(:user))
    visit seeds_path
    puts page.text
    fill_in 'seed_body', with: 'Semilla'
    click_submit
    seed = Seed.last
    seed.body.must_equal 'Semilla'
  end
end
