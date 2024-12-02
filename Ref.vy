# Reference data types
# - Fixed Sized Lists
nums: public(uint256[10]) # This is a fixed size list of 10 uint256

# - Mappings
myMap: public(HashMap[address, uint256])

# - Structs
struct Person:
    name: String[10]
    age: uint256
    
person: public(Person)

@deploy
def __init__():
    self.nums[0] = 123 # This stores the number 123 at index 0
    self.nums[1] = 456

    self.myMap[msg.sender] = 1 # To get value of a mapping stored at this address
    self.myMap[msg.sender] = 11

    self.person.name = "vyper"
    self.person.age = 33

    p: Person = self.person # This will copy the data of name & age into memory into the variable called p
    p.name = "solidity"
    p.age = 22

    #Examples of Advanced Functions
#@external
#@pure
#def multiply(x: uint256, y: uint256) -> uint256:
#    return x * y

#@external
#@pure
#def divide(x: uint256, y: uint256) -> uint256:
#    return x // y

#@external
#def todo():
#    pass

#@external
#@pure
#def return_many() -> (uint256, bool):
#    return (123, True)