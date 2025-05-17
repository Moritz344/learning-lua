api_key = "28d9cb5ebd3b972a213ee547d52c75bd"
city = "Berlin"

temp = nil
temp_max = nil
humidity = nil
sea_level = nil

requests = require("requests")

run = true

function welcomeScreen()
		print("Weather CLI")
		print()
end

welcomeScreen()

function checkStatus(code)
		if code == 404 then
				print(code,"Service not found.")
		end
end

function getWeatherData(data) 
		--for key,value in pairs(data) do
		--		print(key,value)
		--end
		

		for key,value in pairs(data.main) do 
				if key == "temp" then
						temp = value - 275.15
						io.write("temp:",temp,"°C\n")
				elseif key == "temp_max" then
						temp_max = value - 275.15
						io.write("max temp:",temp_max,"°C \n")
				elseif key == "humidity" then
						humidity = value
						io.write("humidity:",humidity," \n")
				elseif key == "sea_level" then
						sea_level = value
						io.write("sea_level:",sea_level," \n")
				end


		end
end

function readUserInput()
		while run do
				io.write("City: ")
				read_input = io.read()
				city = read_input
				base_url = string.format("https://api.openweathermap.org/data/2.5/weather?q=%s&appid=%s", city, api_key)

				response = requests.get(base_url)
				json_body,error = response.json()
				
				if response.status_code == 200 then
						getWeatherData(json_body)
				else
						checkStatus(response.status_code)
				end

				print()
				
		end
end
readUserInput()

