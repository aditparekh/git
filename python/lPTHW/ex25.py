def break_words(stuff):
	"""This function will break up words for us"""
	words = stuff.split(" ")
	return words

def sort_words(words):
	"""Sorts the words"""
	return sorted(words)

def print_first_word(words):
	"""Prints the firs word after popping it off"""
	word=words.pop(0)
	print word

def print_last_words(words):
	"""Prints the last words after popping it off"""
	word=words.pop(-1)
	print word

def sort_sentence(sentence):
	"""takes a full sentence and returns the sorted value"""
	words=break_words(sentence)
	return sort_words(words)

def print_first_and_last(sentence):
	"""prints the first and last word of the sentnce"""
	words=break_words(sentence)
	print_first_word(words),print_last_words(words)

def print_first_and_last_sorted(sentence):
	words=sort_sentence(sentence)
	print_first_word(words),print_last_words(words)