# pragma version 0.4.0

# @pure - do not read any state and global variables
# @view - read state and global variables

# State Variable
count: public(uint256)

# This function does not read any state variables therefore it is pure
@external
@pure
def add(x: uint256, y: uint256) -> uint256:
    return x + y 

# This function reads state and global variables
@external
@view
def add_to_count(x: uint256) -> uint256:
    return x + self.count + block.timestamp # block.timestamp is a global variable

