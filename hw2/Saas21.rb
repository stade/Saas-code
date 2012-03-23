class Numeric
  @@dollars = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  @@euros = {'yen' => 0.013, 'rupee' => 0.019, 'dollar' => 1}
  @@rupees = {'yen' => 0.013, 'euro' => 1.292, 'dollar' => 1}
  @@yen = {'euro' => 1.292, 'rupee' => 0.019,  'dollar' =>  1}
  @current_currency = nil

  def in(currency)

    singular_currency = currency.to_s.gsub( /s$/, '')

    if @current_currency.eql?("dollar")
      return self * @@dollars[singular_currency]
    elsif @current_currency.eql?("euro")
      return self * 1.292 / @@euros[singular_currency]
    elsif @current_currency.eql?("rupee")
      return self * 0.019 / @@rupees[singular_currency]
    elsif @current_currency.eql?("yen")
      return self * 0.013 / @@yen[singular_currency]
    end
  end

  def method_missing(method_id)

    if method_id != nil
      singular_currency = method_id.to_s.gsub( /s$/, '')
      @current_currency = singular_currency
      return self
    else
      super
    end
  end
end


#5.dollars.in(:euros)
#10.dollars.in(:rupees)

class String
  def palindrome?

    string = self

    string.delete!('^a-zA-Z')
    string.downcase!

    string.reverse

    if string.eql?(string.reverse)
      return true
    else
      return false
    end
  end
end

module Enumerable
  def palindrome?
    palindrome = self
    palindrome_arr = Array.new

    if self.class.eql?(Hash)
      return false
    end
    if self.class.eql?(Range)
      self.each do |n|
        palindrome_arr.push(n)
      end
      palindrome = palindrome_arr
    end

    if palindrome.eql?(palindrome.reverse)
      return true
    else
      return false
    end
  end
end

