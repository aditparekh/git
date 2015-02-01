from sys import exit
from random import randint

class Game(object):

	def __init__(self,start):
		self.quips = ["You died. you kinda suck at this.",
		"Your mom would be proud. If she were smarter.",
		"Such a luser.",
		"I have a small puppy that's better at this."]
		self.start=start

	def play(self):
		next=self.start
		next()

		while True:
			print "\n--------"
			
			room = getattr(self,next)
			print room
			next = room()

	def death(self):
		print self.quips[randint(0,len(self.quips)-1)]
		exit(1)


	def princess_lives_here(self):
		print "You see a beautiful Princess with a shiny crown"
		print "She offers you some cake"

		eat_it = raw_input(">")

		if eat_it=="eat it":
			print "you explode like a pinata full of frogs"
			print "The princess cackles and eats the frogs."
			return 'death'

		elif eat_it=='do not eat it':
			print "She throws the cake at you and it cuts of your head"
			print "The last thing you see is her munching on your torso"
			return "death"

		elif eat_it=='make her eat it':
			print "She screams and crams the cake in her mouth"
			print "She points to the tiny door and koi"
			return 'gold_koi_pond'


		else:
			print "The princess looks at you confused and just points at the cake"
			return "princess_lives_here"

	def gold_koi_pond(self):
		print "There is a garden with a joi poing in the vcenter"
		print "You walk close an see a massive fin poke out"
		print " You peek in and a creepy looking hufe Joie stared at you"
		print "It opens and its mount waiting for food"

		feed_it=raw_input(">")

		if feed_it=='feed it':
			print "The Koi jumps up and wats your arm"
			print "You fall in and are eaten"

		elif feed_it=='do not feed it':
			print "the koi grimaces then thrashes around"
			print "It jumps out over you and you poop out"
			return "death"

		elif feed_it=='throw it in':
			print "the koi grimaces then thrashes around"
			print "it is happy and is throws a magical ring to you"
			return "bear_with_sword"

		else:
			print "The Koi gets annoyed and wiggles"
			return 'gold_koi_pond'

	def bear_with_sword(self):
		print "Puzzled, you are about to pick up the fish poop diamond when"
		print "a bear bearing a load bearing sword walks in"
		print " Hey! That\'s my diamond! Where\'d you get that?"
		print "It holds its paw out and looks at you"

		give_it = raw_input(">")

		if give_it=="give it":
			print "The bear swiped at your have and grabs the diamond"
			print "The bear eats you"
			return 'death'

		elif give_it=='say no':
			print 'The bear looks shocked'
			print "it runs of and you notice an iron gate"
			return "big_iron_gate"

		else:
			print "The beear looks puzzled"
			return "bear_with_sword"

	def big_iron_gate(self):
		print "You walk up to the iron gate and see there is a handle"

		open_it = raw_input(">")

		if open_it=="open it":
			print "You open it and are free"
			print "the bear comes and stabd you"
			return 'death'

		else:
			print "That does not seem sensible."
			return 'big_iron_gate'

a_game = Game('princess_lives_here')
a_game.play()
