class PediasController < ContentsController
  expose(:model) { Pedia }
  expose(:pedias) { current_group.pedias }
  expose(:pedia)
  expose(:contents) { pedias }
  expose(:content) { pedia }

end
