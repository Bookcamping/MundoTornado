class CharactersController < ContentsController
  respond_to :html
  before_filter :create_if_not_found, only: :show

  expose(:model) { Character }
  expose(:characters) { current_group.characters }
  expose(:character)
  expose(:contents) { characters }
  expose(:content) { character }

  protected
  def create_if_not_found
    if characters.find_by_title(params[:id]).blank?
      redirect_to new_character_path(t: params[:id])
    end
  end

end
