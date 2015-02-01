ten_things= "Apples Oranges Crows Telephone Light Sugar"
print "Wait there is not 10 things, let's fix it"

stuff=ten_things.split(" ")

more_stuff=["Day","Night","Song","Frisbee","Corn","Banana","Girl","Boy"]

while len(stuff)!=10:
	next_one=more_stuff.pop()
	print 'Adding: ',next_one
	stuff.append(next_one)
	print "There's %d items now"%len(stuff)

print "THere we go: ",stuff

print "Let's do something with stuff"

print stuff[-1]
print stuff.pop()

print ' '.join(stuff)

print '#'.join(stuff[3:5])
print stuff[1:2]

dir()