#class SessionsController < ApplicationController
  #skip_before_action :authenticate!, only: [:new, :create]

  #def new
  #end

  #def create
    #user = User.find_by(email: params[:email])

    #if user&.authenticate(params[:password])
      #flash[:alert] = 'good job!'
      #session[:user_id] = user.id
      #redirect_to cookies[:path] = request.path
    #else
      #flash.now[:alert] = 'Are u a Guru? Verify your Email and Password please'
      #render :new
    #end
  #end

  #def destroy
    #session[:user_id] = nil
    #redirect_to login_path
  #end

#end
