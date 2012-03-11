def palindrome?(string)

    string.delete!('^a-zA-Z')
    string.downcase!

    string.reverse

    if string.eql?(string.reverse)
      return true
    else
      return false
    end
end

def count_words(string)

	  string.delete!('^a-zA-Z ')
    string.downcase!

    arr_of_words = string.split(/ /)
    arr_of_words.delete("")

    h = Hash.new

    arr_of_words.each { |w|
      if h.has_key?(w)
        h[w] = h[w] + 1
      else
        h[w] = 1
      end
    }
    return h
end

