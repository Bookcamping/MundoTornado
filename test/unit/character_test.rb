require 'test_helper' 

describe Character do
  it 'prepend one and only one @ before title' do
    c = create(:character, title: 'Bite')
    c.title.must_equal '@Bite'
    d = create(:character, title: '@@Dite')
    d.title.must_equal '@Dite'
  end

  it 'have mentions' do
    c = create(:character, title: 'Bite')
    s = create(:scene, content: 'Some @Bite here')
    c.mentions.must_include s
  end

  it 'is unique per group' do
    g1 = create(:group)
    g2 = create(:group)
    c = create(:character, title: 'Dani', group: g1)
    c2 = build(:character, title: 'Dani', group: g2)
    c2.save.must_equal true
    c3 = build(:character, title: 'Dani', group: g1)
    c3.save.must_equal false
  end
end
