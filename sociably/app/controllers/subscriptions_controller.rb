class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks_for_select, only: [:new, :edit]
  before_action :check_if_subscribed_to_all, only: [:new]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.where('user_id = ?', current_user.id)
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user_id = current_user.id

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subscription }
      else
        format.html { render action: 'new' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to subscriptions_path, notice: 'Subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:task_id, :progress)
    end

    def set_tasks_for_select
      @tasks = Task.get_for_select(current_user.id)
    end

    # if the user is subscribed to all the tasks, they can't access the new action
    def check_if_subscribed_to_all
      if current_user.tasks.count == Task.count
        redirect_to subscriptions_path, notice: 'You are already subscribed to all the tasks.'
      end
    end
end
