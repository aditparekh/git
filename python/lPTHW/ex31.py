print "You enter a dark room with two doors. Do you go through door #1 or door #2? "

door = raw_input(">")

if door=="1":
	print "There is a bear, What do you want?"
	print "1: Take the cake \n 2:Sream at bear"
	
	bear = raw_input(">")
	if bear == "1":
		print "The bear eats your face, GJ"
	elif bear =='2':
		print "The bear eats your legs, GJ"
	else:
		print "Well doing %s is probabaly better."%bear

elif door =='2':
	print "You stare into the endless abyss"
	print "1:Blue \n 2: Yellow \n 3: Melodies"

	insanity=raw_input(">")

	if insanity == '1' or insanity=='2':
		print "your body survives powered jello"
	else:
		print "The insanity rots your eyes"

else:
	print "you stumble aounrd and fall on a knife"


	






