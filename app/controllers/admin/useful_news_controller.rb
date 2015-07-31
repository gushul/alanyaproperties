class Admin::UsefulNewsController < AdminController
  # GET /admin/useful_news
  # GET /admin/useful_news.json
  def index
    @admin_useful_news = Admin::UsefulNews.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_useful_news }
    end
  end

  # GET /admin/useful_news/1
  # GET /admin/useful_news/1.json
  def show
    @admin_useful_news = Admin::UsefulNews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_useful_news }
    end
  end

  # GET /admin/useful_news/new
  # GET /admin/useful_news/new.json
  def new
    @admin_useful_news = Admin::UsefulNews.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_useful_news }
    end
  end

  # GET /admin/useful_news/1/edit
  def edit
    @admin_useful_news = Admin::UsefulNews.find(params[:id])
  end

  # POST /admin/useful_news
  # POST /admin/useful_news.json
  def create
    @admin_useful_news = Admin::UsefulNews.new(params[:useful_news])

    respond_to do |format|
      if @admin_useful_news.save
        format.html { redirect_to  admin_useful_news_index_path, notice: 'Useful news was successfully created.' }
        format.json { render json: @admin_useful_news, status: :created, location: @admin_useful_news }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_useful_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/useful_news/1
  # PUT /admin/useful_news/1.json
  def update
    @admin_useful_news = Admin::UsefulNews.find(params[:id])

    respond_to do |format|
      if @admin_useful_news.update_attributes(params[:useful_news])
        format.html { redirect_to   admin_useful_news_index_path, notice: 'Useful news was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_useful_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/useful_news/1
  # DELETE /admin/useful_news/1.json
  def destroy
    @admin_useful_news = Admin::UsefulNews.find(params[:id])
    @admin_useful_news.destroy

    respond_to do |format|
      format.html { redirect_to admin_useful_news_index_url }
      format.json { head :no_content }
    end
  end
end
