require 'httparty'
require 'json'

response = HTTParty.get('http://json-server.devpointlabs.com/api/v1/users', format: :plain)
res = JSON.parse response, symbolize_names: true

puts 'All Users'
puts '---------------------------------'
res.each {|user| puts user}

puts ''
puts '1) show user'
puts '2) create user'

  choice = gets.chomp
  if choice == '1'
    puts 'enter user ID you want to view'
    userId = gets.chomp.to_i
    getUser = HTTParty.get("http://json-server.devpointlabs.com/api/v1/users/#{userId}", format: :plain)
    puts getUser
  elsif choice == '2'
    puts 'enter first name'
    first = gets.chomp
    puts 'enter last name'
    last = gets.chomp
    puts 'enter phone number'
    phone = gets.chomp
    
    HTTParty.post("http://json-server.devpointlabs.com/api/v1/users/", {:firstname => first, :last_name => last, :phone_number => phone}.to_json)

    puts 'user created'
  else
    puts 'invalid choice'
  end
