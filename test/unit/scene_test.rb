require 'test_helper'

describe Scene do
  it 'has position' do
    chapter = create(:chapter)
    create(:scene, chapter: chapter).position.must_equal 1
  end

  it 'add the owner as participant' do
    scene = create(:scene)
    Participant.count.must_equal 1
  end

  it 'removes its participants when deleted' do
    scene = create(:scene)
    scene.add(create(:user))
    scene.destroy
    Participant.count.must_equal 0
  end

  it 'updates participants_count when added' do
    scene = create(:scene)
    scene.add(create(:user))
    scene.reload
    scene.participants_count.must_equal 2
  end
end
