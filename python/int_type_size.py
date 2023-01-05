import sys

# The idea is to check how python integer and float size changes with it's value
# For 64 bit architecture integer object is 24 bytes without stored value and it raises
# with integer value stored. Float object is always 24 bytes.

def print_value_and_size(value_string: str, size:int, address: int) -> None:
    print(f"Value: {value_string} \t Size: {size} bytes \t Address: {hex(address)}")

def size_has_changed(previous_size: int, current_size: int) -> bool:
    return previous_size != current_size

def multiply_value_by_2_and_print(input_value, num_of_repetition: int) -> None:
    previous_size = 0
    value = input_value
    for i in range(0, num_of_repetition):
        value = value * 2
        current_size = sys.getsizeof(value) 
        if size_has_changed(previous_size, current_size):
            print_value_and_size(f"{input_value}*2^{i}", current_size, id(value))
            previous_size = current_size


if __name__ == "__main__":
    multiply_value_by_2_and_print(1, 1000)
    multiply_value_by_2_and_print(1.0, 1000)
