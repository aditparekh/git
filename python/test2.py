from sys import argv

source,filename=argv

raw=open(filename,'r')
line=raw.read()

words=line.split()

sentences=line.count(".")+line.count("?")+line.count("!")
no_words=len(words)
unique=set(words)

print no_words,sentences,len(unique),no_words/sentences


#print sentences


