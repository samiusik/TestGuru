class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(contact_params)

    if @feedback.save
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to send_feedback_path, notice: 'Your message send!'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:feedback).permit(:name, :email, :phone_number, :message)
  end
end
