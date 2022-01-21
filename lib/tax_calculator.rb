class TaxCalculator

  def initialize
    @tax_rate = 0
  end

  BASE_RATE = 10
  IMPORT_RATE = 5

  EXEMPT_CATEGORIES = ["book", "medicine", "food"]

  def get_total_taxes(price_before_tax, item_type, is_imported)
    total_tax = price_before_tax * tax_rate(item_type, is_imported) / 100
    return total_tax
  end

  def tax_rate(item_type, is_imported)
    if !EXEMPT_CATEGORIES.include?(item_type)
      @tax_rate += BASE_RATE
    end
    if is_imported == true
      @tax_rate += IMPORT_RATE
    end

    return @tax_rate
  end
end