class Helpdesk::Admin::FaqsController < Helpdesk::Admin::BaseController

  def sort
    params[:faqs].each_with_index do |id, index|
      Helpdesk::Faq.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  # GET /faqs
  # GET /faqs.json
  def index
    if params[:faqs] == 'active'
      @faqs = Helpdesk::Faq.active
    elsif params[:faqs] == 'inactive'
      @faqs = Helpdesk::Faq.inactive
    else
      @faqs = Helpdesk::Faq.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faqs }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
    @faq = Helpdesk::Faq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faq }
    end
  end

  # GET /faqs/new
  # GET /faqs/new.json
  def new
    @faq = Helpdesk::Faq.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Helpdesk::Faq.find(params[:id])
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Helpdesk::Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to admin_faqs_url, notice: 'Faq was successfully created.' }
        format.json { render json: @faq, status: :created, location: @faq }
      else
        format.html { render action: "new" }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faqs/1
  # PUT /faqs/1.json
  def update
    @faq = Helpdesk::Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(faq_params)
        format.html { redirect_to admin_faqs_url, notice: 'Faq was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq = Helpdesk::Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to admin_faqs_url }
      format.json { head :no_content }
    end
  end

  private
  def faq_params
    params.require(:faq).permit(:active, :position, :title, :text, translations_attributes:[:id,:locale,:title,:text])
  end
end
