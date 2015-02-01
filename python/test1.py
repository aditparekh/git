#assignment from Zipfian
raw=open('input1.txt')  
line=raw.readlines()

line=[i.replace('\n',"") for i in line]
max_length=max([len(i) for i in line])


temp,final,words,position,output=[],[],[],[],[]
for i in range(max_length):
	for j in range(len(line)):
		if(len(line[j]) >= i + 1):
			temp+=line[j][i]
	unique=set(temp)
	output ="Position" + str(i) +'('
	for k in unique:
		output+=str(k)+":" +str(round(temp.count(k)*100/len(temp),2)) +'%'
	print output +")"
	temp=[]
	#output  = 'Position:'+str(i)+'('
	
	
	
	


raw.close()
