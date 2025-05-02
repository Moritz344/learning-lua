-- Definition der Klasse
Person = {}
Person.__index = Person

-- Konstruktor
function Person:new(name, age)
    local self = setmetatable({}, Person)
    self.name = name
    self.age = age
    return self
end

-- Methode
function Person:speak()
    print("Hallo, mein Name ist " .. self.name .. " und ich bin " .. self.age .. " Jahre alt.")
end

-- Benutzung
local p1 = Person:new("Anna", 30)
p1:speak()  -- Ausgabe: Hallo, mein Name ist Anna und ich bin 30 Jahre alt.

