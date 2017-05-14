json.messages @messages do |message|
  json.name  message.user.name
  json.time  message.message_time
  json.text  message.text
  json.image message.image.url
end
