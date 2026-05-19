class SubscribersController < ApplicationController
  allow_unauthenticated_access

  def create
    Subscriber.where(subscriber_params).first_or_create
  end

  private

  def subscriber_params
    params.expect(subscriber: [ :email ])
  end
end
