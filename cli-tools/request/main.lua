
run = true
print("Make a request.")

http = require("socket.http")
		
function main()
		while run do
				io.write("You:")
				base_url = io.read()
				body, code, headers, status = http.request(base_url)

				if status == nil then
						print("Error =>",base_url)
				else
						print(status)
						print(body)
				end
		
		end
end

main()
