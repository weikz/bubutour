class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user

    if @tour.save
      redirect_to tour_path(@tour)
      flash[:notice] = "新增旅程成功！"
    else
      render :back
      flash[:warning] = "有些錯誤，請更正！"
    end
  end

  def edit
    @tour = Tour.find(params[:id])

    if @tour.user != current_user
      redirect_to tour_path(@tour)
    end
  end

  def update
    @tour = Tour.find(params[:id])

    if @tour.update_attributes(tour_params)
      redirect_to tour_path(@tour)
      flash[:notice] = "修改旅程成功！"
    else
      render :back
      flash[:warning] = "有些錯誤，請更正！"
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :description)
  end
end
