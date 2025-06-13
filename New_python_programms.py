######### Basic syntax ############

### Assigning to the variables ###

person_name = "Akhila Reddy Mula"
age         = 23
designation = "Implementation Engineer"
company     = "Blusapphire cybersecurities pvt ltd"
print("This is " + person_name)
print("My age is " + str(age))
print ("My designation is " + designation  + " I work in " + company)


######### String Manupulation #########

singer = " I love JB"
print(singer. upper())   #### this is used to print all letters in upper cases #
print(singer. lower())   #### this is used to print all letters in lower cases #

###### Boolean ######  Using if, elif, else functions ##### conditional statements

I_love_India = True
I_love_Germany = False
country_1      = "Australia"

if I_love_India and I_love_Germany:  ### (and, or) ####
    print("Jai Hind")
else:
    print("I love " + country_1)


Blusapphire = False
Cybernext   = True
Worked      = "Blusapphire"

if Blusapphire and Cybernext:
    print(" I worked ")
else:
    print(" I didnt worked in " + Worked)

    
##### The utility of functions #####

def country(name):
    print("I love" + name)
country(" Bhutan ")

def akhi(reddy):
    print(" I work in Blusapphire" + reddy)
akhi(" mula ")

######### Maths calculations #########
from math import*
x = 6   
y = 7
z = 9
print(x, y, z)

print(x+y-z)
print(x*2)
print(y-z*x)

if x > y:
    print("yes")
elif  x == z:
    print("correct")
else:
    print("true")


###################################################

