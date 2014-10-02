#json.extract! @subscription, :id, :user, :task, :progress, :created_at, :updated_at

json.(@subscription, :id, :progress, :created_at)
json.user do |json|
	json.(@subscription.user, :id, :name)
	json.url user_url(@subscription.user)
end

json.task do |json|
	json.(@subscription.task, :id, :name)
	json.url task_url(@subscription.task)
end