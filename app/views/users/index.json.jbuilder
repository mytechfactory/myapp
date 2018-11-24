json.array!(@users) do |user|
  json.extract! user, :id, :Name, :Email, :Phone_No, :Password, :Confirm_Password
  json.url user_url(user, format: :json)
end
