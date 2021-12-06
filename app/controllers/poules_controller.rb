# frozen_string_literal: true

class PoulesController < ApplicationController
  def index
    @poules = Poule.all
  end

  def show
    @poule = Poule.find(params[:id])
  end

  def new
    @poule = Poule.new
  end

  def create
    #TODO Change competition to select
    @poule = Poule.create(safe_params.merge(competition: Competition.first))

    if @poule.save
      redirect_to @poule
    else
      render :new
    end
  end

  def edit
    @poule = Poule.find(params[:id])
  end

  def update
    @poule = Poule.find(params[:id])

    if @poule.update(safe_params)
      redirect_to @poule
    else
      render :edit
    end
  end

  def destroy
    @poule = Poule.find(params[:id])
    @poule.destroy

    redirect_to poules_path
  end

  private

  def safe_params
    params.require(:poule).permit(:number, :piste)
  end
end
