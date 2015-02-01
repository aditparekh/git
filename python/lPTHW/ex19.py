def cheese_and_cracker(cheese_count,boxes_of_crackers):
	print "You have %d cheeses" %cheese_count
	print "You have %d boxes boxes of crackers" %boxes_of_crackers
	print "Man that's enough for a party"
	print "get a blanket\n"

print "we can just give the function numbers directly:"
cheese_and_cracker(20,30)

print "Or we can use variables from our script"
amount_of_cheese=10
amount_of_crackers=50

cheese_and_cracker(amount_of_cheese,amount_of_crackers)

print "We can even do math inside too:"
cheese_and_cracker(10+20,5+6)

print "And we can combine two variables and math:"
cheese_and_cracker(amount_of_cheese+100,amount_of_crackers+1000)


