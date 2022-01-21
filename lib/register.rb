require File.expand_path(File.join(__FILE__, '../', 'item'))
require File.expand_path(File.join(__FILE__, '../', 'tax_calculator'))
require File.expand_path(File.join(__FILE__, '../', 'receipt'))

class Register
  def initialize
    @all_items_arr = []
  end

  def scan_items(input)
    input.each do |item|
      @quantity = item[0]
      @raw_item_text = item[1]
      @per_item_price = item[2]
      
      item = Item.new
      @item_type = item.categorize(@raw_item_text)
      @import_status = item.is_imported?(@raw_item_text)

      @price_before_tax = calc_before_tax_price
      @total_tax_amount = calc_total_tax
      @after_tax_total = calc_after_tax_total

      @all_items_arr.push({
                      quantity: @quantity, 
                      item_desc: @raw_item_text, 
                      total_item_cost: @after_tax_total, 
                      total_tax: @total_tax_amount
                    })
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
    rounded_total = (total_tax_amount * 20).round.to_f/20
    return rounded_total
  end

  def calc_after_tax_total
    after_tax_total = @price_before_tax + @total_tax_amount
    return after_tax_total
  end

  def print_receipt
    receipt = Receipt.new
    receipt.create(@all_items_arr)
  end

end