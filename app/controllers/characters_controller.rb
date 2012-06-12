class CharactersController < ContentsController
  respond_to :html
  before_filter :create_if_not_found, only: :show
  before_filter :require_user, except: [:index, :show]

  expose(:model) { Character }
  expose(:characters) { current_group.characters }
  expose(:character)
  expose(:contents) { characters }
  expose(:content) { character }

  protected
  def create_if_not_found
    if characters.find_by_title(params[:id]).blank?
      if current_user
        redirect_to new_character_path(t: params[:id])
      else
        redirect_to notfound_path(t: params[:id])
      end
    end
  end

end
