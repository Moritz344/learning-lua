-- lua starts at index 1


score = 0
testScores = { }

--testScores[1] = 69
--testScores[2] = 12
--testScores[3] = 44

table.insert(testScores,31)
table.insert(testScores,1)
table.insert(testScores,44)

for index,value in ipairs(testScores) do
  print(index .. ": " .. value)
end
