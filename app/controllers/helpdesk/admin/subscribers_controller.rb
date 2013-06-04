class Helpdesk::Admin::SubscribersController < Helpdesk::Admin::BaseController

  def index
    @subscribers = Helpdesk::Subscriber.page(params[:page])
  end

  def new
    @subscriber = Helpdesk::Subscriber.new()
  end

  def create
    @subscriber = Helpdesk::Subscriber.new(params[:subscriber])
    if @subscriber.save
      redirect_to admin_subscribers_path, notice: t('subscribers.created')
    else
      render action: "index"
    end
  end

  def edit
    @subscriber = Helpdesk::Subscriber.find(params[:id])
  end

  # PUT /subscribers/1
  # PUT /subscribers/1.json
  def update
    @subscriber = Helpdesk::Subscriber.find(params[:id])

    if @subscriber.update_attributes(params[:subscriber])
      redirect_to admin_subscribers_path, notice: 'Subscriber was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber = Helpdesk::Subscriber.find_by_hashcode(params[:hashcode])
    @subscriber.destroy
    redirect_to root_path
  end
end
