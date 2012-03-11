def combine_anagrams(words)

  array = Array.new
  h = Hash.new
  arr = Array.new
  sorted_string = nil

  words.each { |w|

      sorted_string = w.downcase.chars.sort { |a, b| a.casecmp(b) } .join

      if h.has_key?(sorted_string)
        arr = h[sorted_string]
        arr.push(w)
        h[sorted_string] = arr
      else
        #Create new array only when needed
        arr = Array.new
        h[sorted_string] = arr.push(w)
    end
    }

  h.each do  |key, value|

    array.push(value)
  end

  return array
end

#combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])
#combine_anagrams(['a', 'A'])

