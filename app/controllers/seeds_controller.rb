class SeedsController < ApplicationController
  respond_to :html

  expose(:seeds) { current_group.seeds }
  expose(:seed)

  def index
    authorize! :show, Seed
    respond_with seeds
  end
end
