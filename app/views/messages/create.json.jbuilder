json.text @message.text
json.image @message.image.url
json.date @message.created_at.strftime("%Y/%-m/%-d %R")
json.id @message.id
