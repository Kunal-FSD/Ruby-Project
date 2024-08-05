class Cipher
	def cipher(string, shift)
		enc = []
		ar1 = string.downcase.chars.map!{|i| i.ord}
		ar1.each do |j|
			if j < 97 || j > 122
				enc.push(j)
			elsif(j + shift > 122)
				x = j + shift
				y = x - 122
				enc.push(96+y)
			else
				enc.push(j+shift)
			end
		end
		enc.map!{|k| k.chr}
		st = enc.join('')
		p st
	end
end
ab = Cipher.new
ab.cipher("What a string!",5)