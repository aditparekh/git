from sys import argv

script, filename=argv

print "We are going to erase %r" %filename
print "If you don't want that, hit CTRL-C."
print "If you do waht that, hit RETURN"

raw_input("?")

print "Opening the file..."
target=open(filename,'w')

print "Truncating the file, Goodbye"
target.truncate()

print "Now I am going to ask you for three lines"

line1=raw_input("line1:")
line2=raw_input("line2")
line3=raw_input("line3")

print "I am going to write these to the file"

target.write('%s\n%s\n%s'% (line1,line2,line3))

print "and finally we close it"
target=open(filename)
print target.read()

target.close()