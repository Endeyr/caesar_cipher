# nested each method
dict = []
def substring(str, dict)
  hash = {}
  str_array = str.downcase.split
  str_array.each do |i|
    dict.each do |s|
      if i.include?(s)
        if hash.has_key?(s)
          hash[s] += 1
          else hash[s] = 1
        end
      end
    end
  end
  puts hash
end