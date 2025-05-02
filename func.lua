
function greet(name)
  print("Hey " .. name)
end

greet("Peter")

score = 0
score_unranked = 0

function increaseScore(foo )
  local var = foo
  var = foo/2

  return var
end

score = increaseScore(10)
score_unranked = increaseScore(100)

print(score)
print(score_unranked)





