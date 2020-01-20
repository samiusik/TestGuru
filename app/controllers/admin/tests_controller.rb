class Admin::TestsController < Admin::BaseController
  #before_action :authenticate_user!
  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def destroy
    @test.destroy
    redirect_to action: :index
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def new
    @test = Test.new
    @categories = Category.all
  end

  def create
    @test = current_user.tests.new(test_params)

    if @test.save
      redirect_to admin_test_path @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path @test
    else
      render :edit
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_from_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end