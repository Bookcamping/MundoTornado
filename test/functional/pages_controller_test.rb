require 'test_helper'

describe 'Pages integration' do
  #TODO: debería ser cuando pertence al grupo
  it 'can edit if logged_in' do 
    page = create(:page, group: current_group)
    visit page_path(page)
    page.find 'a[rel="edit-page"]'
  end
end
