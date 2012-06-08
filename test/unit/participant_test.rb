require 'test_helper'

describe Participant do
  it 'can be easily created' do
    scene = create(:scene)
    user = create(:user)
    p = Participant.build!(scene, user)
    p.must_be :present?
    Participant.build!(scene, user).must_equal p
  end
end
