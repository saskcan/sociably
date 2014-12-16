class PublishersController < ApplicationController

  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  # GET /pubishers
  # GET /publishers.json
  def index
    @publishers = Publisher.all
  end

  # GET /publishers/1
  # GET /publishers/1.json
  def show
  end

  # GET /publishers/new
  # GET /publishers/new.json
  def new
    @publisher = Publisher.new
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers
  # POST /publishers.json
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, notice: 'Publisher was successfully created.' }
        format.json { render action: 'show', status: :created, location: @publisher }
      else
        format.html { render action: 'new' }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishers/1
  # PATCH/PUT /publishers/1.json
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to @publisher, notice: 'Publisher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pubisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher.destroy
    respond_to do |format|
      format.html { redirect_to publishers_url }
      format.json { head :no_content }
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name)
  end

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

end