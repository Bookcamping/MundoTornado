require 'test_helper'

describe Pedia do
  it 'normalizes title' do
    e = create(:pedia, title: 'La ciudad de cera')
    e.title.must_equal '#la-ciudad-de-cera'
  end
end
