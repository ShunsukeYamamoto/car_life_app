json.array @messages do |message|
  json.id message.id
  json.date message.created_at.strftime("%Y/%-m/%-d %R")
  json.text message.text
  json.image message.image.url
end

json.customer_name @customer.name