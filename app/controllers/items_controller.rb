class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :set_item, only: %i[ show edit update destroy restore ]

  # GET /items or /items.json
  def index
    @items = Item.all
    @items.each {|item| item.weather_description = item.get_current_weather_description}
    respond_to do |format|
      format.html {@items}
      # If I tried to update the attr_accessor within the model and then included it in the json using "methods:" it would not work
      format.json { render json:@items, methods: [:weather_description]}
    end
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /items/1/restore /items/1/restore.json
  def restore
    respond_to do |format|
      if AppServices::DiscardableRecordRestorer.call(@item)
        format.html { redirect_to item_url(@item), notice: "Item was successfully undeleted." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if AppServices::DiscardableRecordUpdater.call(@item, item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else  
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy 
    respond_to do |format|
      if AppServices::DiscardableRecordDiscarder.call(@item, params[:discard_message])
        format.html { redirect_to items_url, notice: "Item was successfully deleted." }
        format.json { head :no_content }
      else  
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :city)
    end
end
