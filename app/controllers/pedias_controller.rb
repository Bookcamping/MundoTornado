class PediasController < ContentsController
  before_filter :create_if_not_found, only: :show

  expose(:model) { Pedia }
  expose(:pedias) { current_group.pedias }
  expose(:pedia)
  expose(:contents) { pedias }
  expose(:content) { pedia }

  protected
  def create_if_not_found
    if pedias.find_by_title(params[:id]).blank?
      redirect_to new_pedia_path(t: params[:id])
    end
  end

end
