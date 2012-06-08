class SeedsController < ApplicationController
  respond_to :html

  expose(:seeds) { current_group.seeds }
  expose(:seed)
  expose(:new_seed) { Seed.new }

  def index
    authorize! :show, Seed
    respond_with seeds
  end

  def show
    authorize! :show, seed
    respond_with seed
  end

  def new
    authorize! :create, Seed
    respond_with seed
  end

  def create
    seed.user = current_user
    authorize! :create, seed
    flash[:notice] = 'Plantando.' if seed.save
    respond_with seed, location: seeds_path
  end

  def destroy
    flash[:notice] = 'Limpiando la maleza' if seed.destroy
    respond_with seed, location: seeds_path
  end
end
