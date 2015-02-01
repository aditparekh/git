from sys import exit

def gold_room():
	print "This room is full of gold. how much do you take?"
	next=raw_input(">")

	if next.isdigit():
		if int(next) < 50:
			print "Nice, you are not greedy, you win"
		else:
			dead("You greedy bastard")
	else:
		dead("Man, learn to type a number")
	
def bear_room():
	print """There is a bear here.
	The bear has a bunch of honey.
	The fat bear is in front of another door.
	How are you going to move the bear"""

	bear_moved=False

	while True:                          
		next=raw_input(">")
		if next=="take honey":
			dead("The bear looks at you and then pimp slaps you")
		elif next=="taunt bear" and not bear_moved:
			print "The bear has moved from teh door, go thru"
			bear_moved=True
		elif next =="open door" and bear_moved:
			gold_room()
		else:
			print "I got no idea what that means"

def cthulu_room():
	print """Here you see the great evil Cthulu
	He, it, whatever stares at you and you go insane
	Do you flee for your like or eat your head"""
	next=raw_input(">")

	if "flee" in next:
		start()
	elif "head" in next:
		dead("Well that was tasty")
	else:
		cthulu_room()

def dead(why):
	print why, "Good job"
	exit(0)

def start():
	print """You are in a dark room.
	There is a door to your right and left
	Which one do you take"""
	next=raw_input(">")

	if next=="left":
		bear_room()
	elif next=="right":
		cthulu_room()
	else:
		dead("You stumble round the room until you starve")

start()
