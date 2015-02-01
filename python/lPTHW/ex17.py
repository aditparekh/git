from sys import argv
from os.path import exists

#optional use of a function to open and read
def file_function(file):
	temp=open(file)
	file=temp.read()
	return file

script,from_file,to_file=argv

print "Copying from %s to %s" %(from_file,to_file)

#with open(from_file) as f: 
#	indata=f.read()
#	f.close()

indata = open(from_file).read()

print "The input file is %d bytes long" %len(indata)

#print "Does the coutput file exist? %r" %exists(to_file)
#print "Ready, hit Return to continue, CTSL-C to abort"
#raw_input()


if not exists(to_file):
	output = open(to_file,'w')
	output.write(indata)
	print "All Done"
	output.close()
else:
	print "File already exists"

#making it one line long
#open(to_file,'w').write(open(from_file).read())



