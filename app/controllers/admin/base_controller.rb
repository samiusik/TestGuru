class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Вы не можете проссматривать данную страницу' unless admin?
  end

  def admin?
    current_user.is_a? Admin
  end
end