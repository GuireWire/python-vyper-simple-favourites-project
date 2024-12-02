# pragma version 0.4.0
# @license MIT

# favorite things list:
# favorite numbers
# favorite people with their favorite numbers

# has_favorite_number: bool
# my_address: my_address
# my_decimal: decimal
# my_bytes: bytes32

#Constructor
# owner: public(address)
# name: public(String[100])
# expiresAt: public(uint256)

#@deploy
#def __init__(name: String[100], duration: uint256):
#    self.owner = msg.sender
#    self.name = name
#    self.expiresAt = block.timestamp + duration

# Constructor
@deploy
def __init__():
    self.my_favorite_number = 4 # This sets my fav number to 7 the minute we deploy this contract
    self.index = 0
    self.my_name = "Anthony!"

# Struct
struct Person:
    favorite_number: uint256
    name: String[100]

struct FavoriteThings:
    color: String[100]
    animal: String[100]

# State Variable (Storage Variable) that starts off as 0
my_favorite_number: public(uint256) # 0

favorite_things_list: public(FavoriteThings[5])
favorite_things_index: public(uint256)

my_name: public(String[100])

list_of_numbers: public(uint256[5]) # This adds an array list of 5 elements long
list_of_people: public(Person[5]) # This is a list of Persons eg (7, Anthony), (15, Patrick)
index: public(uint256)

name_to_favorite_number: public(HashMap[String[100], uint256])
# eg John, 12 -> you'll be able to find John and see what his fav number is


# Extrernal Function that Stores New Number to Fav Number
@external
def store(new_number: uint256): #store function declared with def
    self.my_favorite_number = new_number # set new_number as my_favorite_number

# External View Function that returns a Uint256
@external
@view
def retrieve() -> uint256: 
    return self.my_favorite_number

@external
def add_person(name: String[100], favorite_number: uint256):
    # Add favorite number to the numbers list
    self.list_of_numbers[self.index] = favorite_number # This sets favorite number to the 0 index of list_of_numbers

    #Add the person to the person's list
    new_person: Person = Person(favorite_number = favorite_number, name = name) # This sets fav number of struct persons fav number and name to name
    # eg (7, Anthony)
    self.list_of_people[self.index] = new_person

    #Add the person to the hashmap
    self.name_to_favorite_number[name] = favorite_number

    self.index = self.index + 1 # This means when we update index 0 to fav number 5, the next time we update the fav number, it will be index 1, then 2 etc.

@external
def add_one():
    self.my_favorite_number += 1

# Function to Add a new FavoriteThings to the List
@external
def add_favorite_thing(color: String[100], animal: String[100]):
    #Create a new FavoriteThings struct
    new_favorite_thing: FavoriteThings = FavoriteThings(
        color = color,
        animal = animal
    )

    # Save the new struct to the state variable array
    self.favorite_things_list[self.favorite_things_index] = new_favorite_thing

    # Increment the index for the next entry
    self.favorite_things_index += 1
