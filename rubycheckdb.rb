#DB CONNECTOR
require 'mysql'  
  
#my = Mysql.new(hostname, username, password, databasename)  
con = Mysql.new('localhost', 'root', 'root', 'moizdb')  
rs = con.query('select * from students')  
rs.each_hash { |h| puts h['id']+" "+h['first_name']+" "+h['last_name']+" is "+h['age']+" years old..."}  
con.close 

require "net/http"

#HTTP CONNECTOR
uri = URI('http://localhost/sqldb.php')
Net::HTTP.get(uri) # => String
res = Net::HTTP.get_response(uri)

#puts res.body if res.is_a?(Net::HTTPSuccess): (NET::HTTPError)
res['Set-Cookie']            # => String
res.get_fields('set-cookie') # => Array
res.to_hash['set-cookie']    # => Array
puts "Headers: #{res.to_hash.inspect}"

# Status

puts res.code       # => '200'
puts res.message    # => 'OK'
puts res.class.name # => 'HTTPOK'

# Body
puts res.body if res.is_a?(Net::HTTPSuccess)
Net::HTTP.get_response('localhost', '/sqldb.php/') do |response|
  response.read_body do |segment|
    puts "Received segment of #{segment.size} byte(s)!"
  end
end

