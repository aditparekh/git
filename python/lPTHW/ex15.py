# saves the input into argv using the mobile argv
from sys import argv

#stored the values into script and filename
script,filename =argv

#opens the file for reading and saves it in txt object
txt=open(filename,'r')

#print "Here is your file %r" %filename
#txt.write("\n testing")
print txt.read()
txt.close()

#txt=open(filename)

#prints the content of the object txt

#get an input of ex15_sample.txt from teh user
#print "I'll also ask you to type it again"
#file_again=raw_input('>')

#open the sample file which is saved in file_again
#txt_again=open(file_again)

#print txt_again.read()