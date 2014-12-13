class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update, :destroy]
  before_action :set_tasks_for_select, only: :index
  before_action :set_subscribed_to_all, only: :index
  before_action :set_user, only: :index

  helper_method :sort_column, :sort_direction
  # GET user/1/subscriptions
  # GET user/1/subscriptions.json
  def index
    #@subscription = current_user.subscriptions.build()
    @subscriptions = current_user.subscriptions.sort_by { |subscription| subscription.subscribable.display_name }
    @subscription = current_user.subscriptions.build()
    #@subscriptions.sort_by  {|subscription| subscription.subscribable.display_name }
    #@subscriptions = Subscription.where('user_id = ?', current_user.id).sort_by(:&title).joins(:task).order(sort_column + " " + sort_direction)
    @complete_subscription_count = 0
    @subscriptions.each do |s|
      if s.progress == 1
        @complete_subscription_count = @complete_subscription_count + 1
      end
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # POST user/1/subscriptions
  # POST user/1/subscriptions.json
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
        format.html { redirect_to user_subscriptions_path(current_user), notice: 'Subscription was successfully updated.' }
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
      format.html { redirect_to user_subscriptions_url(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:task_id, :progress)
    end

    def set_tasks_for_select
      @tasks = Task.get_for_select(current_user.id)
    end

    # if the user is subscribed to all the tasks, they can't access the new action
    def set_subscribed_to_all
      @subscribed_to_all = (current_user.subscriptions.count == Book.count + Website.count)
    end

    def sort_column
      ((Subscription.column_names.push("name")).include?(params[:sort])) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
