class Substring_Check	
	def substrings(word, dt)
		result = Hash.new(0)
		word = word.downcase
		dt.each do |sub|
			sub = sub.downcase
			count = 0
			(0..word.length-sub.length).each do |i|    # Iterating through each charater of word
				if word[i,sub.length] == sub
					count += 1
				end
			end
			result[sub] = count if count > 0
		end
		return result
	end
end
ob = Substring_Check.new
dt = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
result1 = ob.substrings("below", dt)
result2 = ob.substrings("Howdy partner, sit down! How's it going?", dt)
puts result1
puts result2