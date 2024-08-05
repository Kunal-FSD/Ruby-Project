def bubble_sorting(array)
	i= 0
	puts "unsorted array"
	print array
	print "\n"
	n = array.length
	for i in (0...(n-1))
		for j in (0...(n-i-1))
			if(array[j] > array[j+1])
				array[j],array[j+1] = array[j+1], array[j]
			end
		end
	end
	
	puts "sorted array"
	print array
end
bubble_sorting([1,5,3,2,4])
