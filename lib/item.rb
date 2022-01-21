class Item
  
  def categorize(raw_text)
    text_arr = raw_text.split(" ")
    # classify item type based on keywords
    if text_arr.include?("chocolate") || text_arr.include?("chocolates")
      return "food"
    elsif text_arr.include?("pills")
      return "medicine"
    elsif text_arr.include?("book")
      return "book"
    else
      return "other"
    end
  end

  def is_imported?(raw_text)
    text_arr = raw_text.split(" ")
    if text_arr.include?("imported")
      return true
    else
      return false
    end
  end
end