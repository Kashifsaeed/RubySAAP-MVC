require 'socket'
require 'net/http' 
host = 'localhost'     # The web server
port = 80                           # Default HTTP port
path = "/sqldb.php"                 # The file we want 

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"
print "Enter a URL: " 
useruri=gets
uri = URI(useruri)
socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
if (uri.path==path)
puts body                          # And display it
else
puts "Sorry this page cant be displayed"
end

