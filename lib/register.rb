require File.expand_path(File.join(__FILE__, '../', 'item'))
require File.expand_path(File.join(__FILE__, '../', 'tax_calculator'))
require File.expand_path(File.join(__FILE__, '../', 'receipt'))

class Register
  def initialize
    @total_cost = 0 #total tax (sales + import) + item cost
    @all_items_arr = []
  end

  def scan_items(input)
    input.each do |item|
      @quantity = item[0]
      @raw_item_text = item[1]
      @per_item_price = item[2].to_i.round(2)
      
      item = Item.new
      @item_type = item.categorize(@raw_item_text)
      @import_status = item.is_imported?(@raw_item_text)

      @price_before_tax = calc_before_tax_price
      @total_tax = calc_total_tax
      @total_cost = calc_after_tax_total

      @all_items_arr.push({quantity: @quantity, item_desc: @raw_item_text, total_item_cost: @total_cost, total_tax: @total_tax})
    end
    print_receipt
  end

  def calc_before_tax_price
    before_tax = @quantity * @per_item_price
    return before_tax
  end

  def calc_total_tax
    tax_calc = TaxCalculator.new
    total_tax_amount = tax_calc.get_total_taxes(@price_before_tax, @item_type, @import_status)
    return total_tax_amount
  end

  def calc_after_tax_total
    after_tax = @price_before_tax + @total_tax
    return after_tax
  end

  def print_receipt
    receipt = Receipt.new
    receipt.create(@all_items_arr)
  end

end