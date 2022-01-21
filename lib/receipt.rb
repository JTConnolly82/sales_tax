class Receipt

  def initialize
    @line_items = []
    @combined_tax_amount = 0
    @total_cost_combined_after_tax = 0
  end

  def create(all_items_arr)
    all_items_arr.each do |obj|
      quantity = obj[:quantity]
      item_description = obj[:item_desc]
      total_cost = obj[:total_item_cost]
      total_tax = obj[:total_tax]
      @line_items.push(["#{quantity.to_i}", "#{item_description}", "#{total_cost.to_i}"])
      @combined_tax_amount += total_tax
      @total_cost_combined_after_tax += total_cost
    end

    print_receipt #prints to command line

    return {
      line_items: @line_items, 
      combined_tax_amount: @combined_tax_amount,
      total_cost_combined_after_tax: @total_cost_combined_after_tax
    }
  end

  def print_receipt
    puts ""
    puts "------------"
    puts @line_items
    puts ""
    puts "Sales Taxes: #{@combined_tax_amount}"
    puts "Total: #{@total_cost_combined_after_tax}"
    puts "------------"
    puts ""
  end
end