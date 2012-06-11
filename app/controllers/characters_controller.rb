class CharactersController < ContentsController
  respond_to :html

  expose(:model) { Character }
  expose(:characters) { current_group.characters }
  expose(:character)
  expose(:contents) { characters }
  expose(:content) { character }

end
