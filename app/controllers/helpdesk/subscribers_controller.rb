module Helpdesk
  class SubscribersController < Helpdesk::ApplicationController


    def index
      @subscriber = Subscriber.new
      @subscriber.lang = locale

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @subscriber }
      end
    end

    def create
      @subscriber = Subscriber.new(subscriber_params)

      respond_to do |format|
        if @subscriber.save
          format.html { redirect_to @subscriber, notice: 'Subscriber was successfully created.' }
          format.json { render json: @subscriber, status: :created, location: @subscriber }
        else
          format.html { render action: "new" }
          format.json { render json: @subscriber.errors, status: :unprocessable_entity }
        end
      end
    end


    # DELETE /subscribers/1
    # DELETE /subscribers/1.json
    def destroy
      @subscriber = Subscriber.find(params[:id])
      @subscriber.destroy

      respond_to do |format|
        format.html { redirect_to subscribers_url }
        format.json { head :no_content }
      end
    end

    private

    def subscriber_params
      params.require(:subscriber).permit(:email,:lang, :name)
    end
  end
end
