class Helpdesk::Admin::FaqsController < Helpdesk::Admin::BaseController

  def sort
    params[:faqs].each_with_index do |id, index|
      Helpdesk::Faq.find(id).update_column(:position, index+1)
    end
    render :nothing => true
  end

  def sorting
    if params[:id]=='all'

      @faqs = Helpdesk::Faq.roots
    else
      @faq = Helpdesk::Faq.find(params[:id])
      @faqs = @faq.children
    end
  end

  # GET /faqs
  # GET /faqs.json
  def index
    if params[:faqs] == 'active'
      @faqs = Helpdesk::Faq.roots.active
      render action: 'index'
    elsif params[:faqs] == 'inactive'
      @faqs = Helpdesk::Faq.inactive
      render action: 'inactive'
    else
      @faqs = Helpdesk::Faq.roots
      render action: 'index'
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
    @faq = Helpdesk::Faq.active.new
    if params[:faq] && params[:faq][:parent_id]
      @faq.parent_id = params[:faq][:parent_id]
    end

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
    params.require(:faq).permit(:active, :position, :title, :text,:parent_id, translations_attributes:[:id,:locale,:title,:text])
  end
end
