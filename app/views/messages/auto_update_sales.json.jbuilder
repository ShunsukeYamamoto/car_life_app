json.array @messages do |message|
  json.id message.id
  json.date message.created_at.strftime("%Y/%-m/%-d %R")
  json.text message.text
  json.image message.image.url
  json.customer User.find(message.customer_id)
end