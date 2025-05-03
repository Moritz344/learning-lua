
run = true
score = 0

while run do
    
    number_1 = math.random(1, 11)
    number_2 = math.random(1, 11)

    op = math.random()


    result = nil

    function IncreaseScore(foo)
      score = score + foo
      print("Score:",score)
      return score
    end
    
    function add(n1,n2) 
      local formatted_aufgabe = string.format("%d + %d",n1,n2)
      print()
      print(formatted_aufgabe)
      result = n1+n2
    end

    function subtract(n1,n2)
      local formatted_aufgabe = string.format("%d - %d",n1,n2)
      print()
      print(formatted_aufgabe)
      result = n1-n2
    end

    function mal(n1,n2)
      local formatted_aufgabe = string.format("%d * %d",n1,n2)
      print()
      print(formatted_aufgabe)
      result = n1*n2
    end

    function divide(n1,n2)
      local formatted_aufgabe = string.format("%d / %d",n1,n2)
      print()
      print(formatted_aufgabe)
      local factor = 10 ^ 2
      result = n1/n2
      local rounded_result = math.floor(result * factor + 0.5) / factor
      result = rounded_result
    end
    
    function decideAufgabe()
        if op < 0.25 then
          add(number_1,number_2)
        elseif op < 0.5 then
          subtract(number_1,number_2)
        elseif op < 0.75 then
          mal(number_1,number_2)
        else
          divide(number_1,number_2)
        end
    end

    decideAufgabe()

    
    print("User: ")
    read_input = io.read("*number")


    function checkAnswer()
        if read_input == result then
          score = IncreaseScore(1)
          print("Correct Answer.")
        else
          score = 0
          print("Wrong Answer. The right answer was " .. result)
        end
    end
    checkAnswer()


    
    if read_input == nil then
      run = false
      print("Please enter numbers!")
    end

end
