module Helpdesk
  class SubscribersController < Helpdesk::ApplicationController

    def index
      @subscriber = Subscriber.new
      @subscriber.lang = locale
    end

    def create
      @subscriber = Subscriber.new(subscriber_params)
      if @subscriber.save
        redirect_to root_path, notice: 'Subscriber was successfully created.'
      else
        render action: "index"
      end
    end

    def activation
      @subscriber = Subscriber.where(hashcode:params[:hashcode],confirmed:false).first
      @subscriber.update_attributes(hashcode:nil,confirmed:true) if @subscriber
      redirect_to root_path,notice: 'Subscriber was successfully activated.'
    end

    def destroy
      @subscriber = Subscriber.where(hashcode:params[:hashcode],confirmed:true).first
      @subscriber.destroy if @subscriber
      redirect_to root_path,notice: 'Subscriber was successfully deleted.'
    end

    private

    def subscriber_params
      params.require(:subscriber).permit(:email,:lang, :name)
    end
  end
end
