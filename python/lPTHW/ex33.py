def iteration(num,incr):
	test=[]
	for i in range(num):
		test.append(i)
		i+=incr
	return test

print iteration(10,2)




"""
def iteration(num,incr):
	i = 0
	numbers=[]
	while i<num:
		print "At the top i is %d" %i
		numbers.append(i)
		i+=incr
	return numbers

print iteration(10,2)
"""