hairs=['brown','blond','red']
clown=[hairs,'test1','test2']

#print clown[0][1][1]

the_count=range(1,5)
fruits=['apples','oranges','pears','apricots','apples']
change=[1,'pennies',2,'dimes',3,'quarters']

#this first kind of for loop goes through a list
print fruits
fruits.remove('apples')
print fruits

for number in the_count:
	print "This is the count %d"%number

for fruit in fruits:
	print "A fruit of type: %s"%fruit

for i in change:
	print "I got %r" %i

elements=[]

for i in range(0,6):
	print "Adding %d to the list"%i
	elements.append(i)

test = range(0,6)
print test[1]

for i in elements:
	print "Elements was: %d"%i
