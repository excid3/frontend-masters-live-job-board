class UnsubscribesController < ApplicationController
  allow_unauthenticated_access
  before_action :set_subscriber

  def show
  end

  def destroy
    @subscriber.destroy
    redirect_to root_path, notice: "You have been unsubscribed."
  end

  private

  def set_subscriber
    @subscriber = Subscriber.find_by_token_for!(:unsubscribe, params[:token])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Invalid unsubscribe token"
  end
end
