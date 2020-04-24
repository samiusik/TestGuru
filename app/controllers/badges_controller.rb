class BadgesController < ApplicationController
    before_action :set_badge, only: %i[show edit update destroy]
  before_action :set_badges, only: :index

  def index
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_url(@badge), notice: 'Загрузка выполнена!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_url(@badge), notice: 'Успешно обновлено!'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_url, notice: 'Картинка удалена'
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :rule)
  end
end

