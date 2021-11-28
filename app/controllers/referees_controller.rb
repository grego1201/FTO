# frozen_string_literal: true

class RefereesController < ApplicationController
  def index
    @referees = Referee.all
  end

  def show
    @referee = Referee.find(params[:id])
  end

  def new
    @referee = Referee.new
  end

  def create
    @referee = Referee.create(safe_params)

    if @referee.save
      redirect_to @referee
    else
      render :new
    end
  end

  def edit
    @referee = Referee.find(params[:id])
  end

  def update
    @referee = Referee.find(params[:id])

    if @referee.update(safe_params)
      redirect_to @referee
    else
      render :edit
    end
  end

  def destroy
    @referee = Referee.find(params[:id])
    @referee.destroy

    redirect_to referees_path
  end

  private

  def safe_params
    params.require(:referee).permit(:first_name, :last_name, :birthday, :country, :gender)
  end
end
