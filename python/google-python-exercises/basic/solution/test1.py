import re

values=['cat100', '---200', 'xxxyyy', 'jjj', 'box4000', 'tent500']
test=[]
for v in values:
	m= re.search('---\w+|jjj',v)
	if m:
		test.append(v)
	else:
		None
print test