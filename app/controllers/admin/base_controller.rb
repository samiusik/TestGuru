class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Вы не можете проссматривать данную страницу' unless current_user.admin?
  end
end