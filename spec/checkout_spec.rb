require File.expand_path(File.join(__FILE__, '../../lib/', 'register'))

describe "Checkout Items" do
  context 'for input_1' do

   input_1 = [
    [1, 'book', 12.49], 
    [1, 'music cd', 14.99], 
    [1, 'chocolate bar', 0.85]
   ]
   input_1_line_items = [[1, 'book', 12.49], [1, 'music CD', 16.49], [1, 'chocolate bar', 0.85]]
   input_1_total_taxes = 1.50
   input_1_total_price= 29.83

    it 'return proper values for receipt' do
      register = Register.new
      
      expect(register.scan_items(input_2)).to eq(
        line_items: input_1_line_items, 
        combined_tax_amount: input_1_total_taxes, 
        total_cost_combined_after_tax: input_1_total_price
      )
    end
  end

  context 'for input_2' do
    input_2 = [
      [1, 'imported box of chocolates', 10.00], 
      [1, 'imported bottle of perfume', 47.50]
    ]
    input_2_line_items = [[1, 'imported box of chocolates', 10.50], [1, 'imported bottle of perfume', 54.65]]
    input_2_total_taxes = 7.65
    input_2_total_price= 65.15

    it 'return proper values for receipt' do
      register = Register.new

      expect(register.scan_items(input_2)).to eq(
        line_items: input_2_line_items, 
        combined_tax_amount: input_2_total_taxes, 
        total_cost_combined_after_tax: input_2_total_price
      )
    end

  end

  context 'for input_3' do
    input_3 = [
      [1, 'imported bottle of perfume', 27.99], 
      [1, 'bottle of perfume', 18.99], 
      [1, 'packet of headache pills', 9.75],
      [1, 'box of imported chocolates', 11.25]
    ]
    input_3_line_items = [[1, 'imported bottle of perfume', 32.19], [1, 'bottle of perfume', 20.89], [1, 'packet of headache pills', 9.75], [1, 'imported box of chocolates', 11.85]]
    input_3_total_taxes = 6.70
    input_3_total_price= 74.68

    it 'return proper values for receipt' do
      register = Register.new

      expect(register.scan_items(input_3)).to eq(
        line_items: input_3_line_items,
        combined_tax_amount: input_3_total_taxes,
        total_cost_combined_after_tax: input_3_total_price
      )
    end
  end
end