formatter="%r %r %r %r"

print formatter %(1,2,3,4), formatter % ('one','two','three','four')
print formatter % (True, False, False, True)
print formatter % ("I had this thing","/nThat you could type up",
	"But it din't sing",
	"So I said goodnight"
	)
test='test'
hello = "This is a rather long string containing\nseveral lines of text much as you would do in C."

print hello, test
