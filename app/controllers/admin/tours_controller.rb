class Admin::ToursController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)

    if @tour.save
      redirect_to tours_path(@tour)
    else
      render :back
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def udpate
    @tour = Tour.find(params[:id])

    if @tour.update_attributes(tour_params)
      redirect_to tours_path(@tour)
    else
      render :back
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy!
  end
end
