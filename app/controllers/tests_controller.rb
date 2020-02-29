class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
  
  def index
    @tests = Test.all
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_from_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end