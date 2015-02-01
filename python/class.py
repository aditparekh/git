

'''class Customer(object):
    """Following properties: name, balance"""


    def __init__(self,name,balance=0.0):
        """returns a customer object with name and balance"""
        self.name=name
        self.balance=balance

    def withdraw(self,amount):
        """Returns the balance"""
        if amount>self.balance:
            raise RunTimeError("Amt greater than balance")
        else:
            self.balance-=amount
        return self.balance

    def deposit(self,amount):
        """returns balance"""
        self.balance+=amount
        return self.balance

jeff=Customer('Jeff','1000')








class Employer():
    empCount=0
    def __init__(self,name,salary):
        self.number=0
        self.name=name
        self.salary=salary
        Employer.empCount+=1

    def displayCount(self):
        print "Total Employemee %d" % Employer.empCount

    def displayEmployee(self):
        print "Name:",self.name, ",Salary:",self.salary

    def some_function(self):
        print "I got called"

    def add_me_up(self,more):
        self.number+=more
        return self.number

#two things different
e1= Employer('adit',30)
e2= Employer('arti',30)

e1.displayEmployee()
e2.displayEmployee()

e1.displayCount()

print e1.name



print e1.add_me_up(20)
print e1.add_me_up(20)
print e1.add_me_up(30)
print e1.add_me_up(30)

print e1.number




class Person:
    def __init__(self, name):

        self.nm=name

    def show(self, n1, n2):

        print self.nm
        print 'Sum = ', (n1 + n2)

    def __del__(self):
        print 'deleting object Destructor', self.nm

p=Person('Jay')
p.show(2, 3)
print p.__doc__
print p.__init__.__doc__
print p.show.__doc__





class Complex:
    """Testing to see"""
    def __init__(self,realpart,imagpart):
        self.r=realpart
        self.i=imagpart

x=Complex(3.0,-4.5)



c



class Shape: #shape is the variable
#width of x and height of , self is the first parameter defined in any funcition.
#to use any variables in self we need to self.x
    def __init__(self,x,y): 
        self.x = x
        self.y = y
    description = "This shape has not been described yet"
    author = "Nobody has claimed to make this shape yet"
    def area(self):
        return self.x * self.y
    def perimeter(self):
        return 2 * self.x + 2 * self.y
    def describe(self,text):
        self.description = text
    def authorName(self,text):
        self.author = text
    def scaleSize(self,scale):
        self.x = self.x * scale
    self.y = self.y * scale

rectangle = Shape(100,45)

'''