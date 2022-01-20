require File.expand_path(File.join(__FILE__, '../lib/', 'register'))

input_one = [
  [1, 'book', 12.49], 
  [1, 'music cd', 14.99], 
  [1, 'chocolate bar', 0.85]
]
input_two = [
  [1, 'imported box of chocolates', 10.00], 
  [1, 'imported bottle of perfume', 47.50]
]
input_three = [
  [1, 'imported bottle of perfume', 27.99], 
  [1, 'bottle of perfume', 18.99], 
  [1, 'packet of headache pills', 9.75],
  [1, 'box of imported chocolates', 11.25]
]

############################################################
# For manually running examples

register_1 = Register.new
register_2 = Register.new
register_3 = Register.new

register_1.scan_items(input_one)

register_2.scan_items(input_two)

register_3.scan_items(input_three)