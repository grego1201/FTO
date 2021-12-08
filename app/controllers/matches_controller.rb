# frozen_string_literal: true

class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
  end

  def create
    # TODO: Add select of right and left fencers
    @match = Match.create(safe_params.merge({
      right_fencer: Fencer.first,
      left_fencer: Fencer.last
    }))

    if @match.save
      redirect_to @match
    else
      render :new
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])

    if @match.update(safe_params)
      redirect_to @match
    else
      render :edit
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    redirect_to matches_path
  end

  private

  def safe_params
    params.require(:match).permit(:left_points, :right_points, :priority)
  end
end
