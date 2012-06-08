require 'test_helper'

describe Chapter do
  it 'has position' do
    group = create(:group)
    create(:chapter, group: group).position.must_equal 1
    create(:chapter, group: group).position.must_equal 2
  end

  it 'has scenes counter' do
    chapter = create(:chapter)
    scene = create(:scene, chapter: chapter)
    chapter.reload
    chapter.scenes_count.must_equal 1
  end
end
