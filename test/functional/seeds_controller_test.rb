require 'test_helper'

describe 'Seeds integration' do
  it 'list seeds' do
    group = create(:group)
    seed = create(:seed, group: group)

    visit seeds_path
    page.text.must_include seed.body
  end
end
