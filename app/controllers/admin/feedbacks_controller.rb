class Admin::FeedbacksController < AdminController
  # GET /admin/feedbacks
  # GET /admin/feedbacks.json
  def index
    @admin_feedbacks = Admin::Feedback.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_feedbacks }
    end
  end

  # GET /admin/feedbacks/1
  # GET /admin/feedbacks/1.json
  def show
    @admin_feedback = Admin::Feedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_feedback }
    end
  end

  # GET /admin/feedbacks/new
  # GET /admin/feedbacks/new.json
  def new
    @admin_feedback = Admin::Feedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_feedback }
    end
  end

  # GET /admin/feedbacks/1/edit
  def edit
    @admin_feedback = Admin::Feedback.find(params[:id])
  end

  # POST /admin/feedbacks
  # POST /admin/feedbacks.json
  def create
    @admin_feedback = Admin::Feedback.new(params[:admin_feedback])

    respond_to do |format|
      if @admin_feedback.save
        format.html { redirect_to admin_feedback_path(@admin_feedback), notice: 'Feedback was successfully created.' }
        format.json { render json: @admin_feedback, status: :created, location: @admin_feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/feedbacks/1
  # PUT /admin/feedbacks/1.json
  def update
    @admin_feedback = Admin::Feedback.find(params[:id])

    respond_to do |format|
      if @admin_feedback.update_attributes(params[:admin_feedback])
        format.html { redirect_to admin_feedback_path(@admin_feedback), notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/feedbacks/1
  # DELETE /admin/feedbacks/1.json
  def destroy
    @admin_feedback = Admin::Feedback.find(params[:id])
    @admin_feedback.destroy

    respond_to do |format|
      format.html { redirect_to admin_feedbacks_url }
      format.json { head :no_content }
    end
  end
end
