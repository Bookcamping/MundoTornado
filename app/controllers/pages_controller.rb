# encoding: utf-8
class PagesController < ContentsController
  expose(:model) { Page }
  expose(:contents) { current_group.pages }
  expose(:content)
  
end
