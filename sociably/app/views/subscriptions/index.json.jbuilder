json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :user, :task, :progress
  json.url subscription_url(subscription, format: :json)
end
