import sys

# The idea is to check how python integer size changes with it's value

def print_value_and_size(value_string: str, size:int, address: int) -> None:
    print(f"Value: {value_string} \t Size: {size} bytes \t Address: {hex(address)}")

def size_has_changed(previous_size: int, current_size: int) -> bool:
    return previous_size != current_size

integer = 0
print_value_and_size(f"{str(integer)}", sys.getsizeof(integer), id(integer))

integer = -1
print_value_and_size(f"{str(integer)}", sys.getsizeof(integer), id(integer))

integer = 1
previous_size = 0

for i in range(0, 1000):
    integer *= 2
    current_size = sys.getsizeof(integer)
    if size_has_changed(previous_size, current_size):
        print_value_and_size(f"2^{i}", current_size, id(integer))
        previous_size = current_size
