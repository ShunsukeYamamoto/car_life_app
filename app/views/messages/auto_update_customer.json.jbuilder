json.array @messages do |message|
  json.id message.id
  json.date message.created_at.strftime("%Y/%-m/%-d %R")
  json.text message.text
  json.image message.image.url
  json.sales User.find(message.event.sales_id)
end