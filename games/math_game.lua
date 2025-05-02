
run = true

while run do
    
    number_1 = math.random(1, 11)
    number_2 = math.random(1, 11)

    result = nil
    
    function add(n1,n2) 
      formatted_aufgabe = string.format("%d + %d",n1,n2)
      print()
      print(formatted_aufgabe)
      result = n1+n2
    end

    function subtract(n1,n2)
      formatted_aufgabe = string.format("%d - %d",n1,n2)
      print()
      print(formatted_aufgabe)
      result = n1-n2
    end

    if math.random() > 0.6 then
        add(number_1,number_2)
    else
      subtract(number_1,number_2)
    end
    
    print("User: ")
    read_input = io.read("*number")


    function checkAnswer()
        if read_input == result then
          print("Correct Answer.")
        else
          print("Wrong Answer. The right answer was " .. result)
        end
    end
    checkAnswer()

    
    if read_input == nil then
      run = false
      print("Please enter numbers!")
    end

end
