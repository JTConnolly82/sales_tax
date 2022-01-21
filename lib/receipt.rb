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
      # moves imported to front of description for receipt
      if item_description.include?('imported')
        description_arr = item_description.split(" ")
        imported_index = description_arr.find_index("imported")
        if imported_index != 0
          description_arr.delete_at(imported_index)
          description_arr.unshift("imported")
          item_description = description_arr.join(" ")
        end
      end
      total_cost = obj[:total_item_cost]
      total_tax = obj[:total_tax]
      @line_items.push([quantity, item_description, total_cost])
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
    @line_items.each do |item|
      puts "#{item[0]}, #{item[1]}, #{item[2]}"
    end
    puts ""
    puts "Sales Taxes: #{@combined_tax_amount}"
    puts "Total: #{@total_cost_combined_after_tax}"
    puts "------------"
    puts ""
  end
end