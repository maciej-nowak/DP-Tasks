module Myset  (mymember, mysubset, myunion, myintersection, mydifference) where  
import Data.List

--Myset module with functions
mymember x elements = elem x elements
 
mysubset [] elements = True
mysubset (h:t) elements = if (elem h elements == True) then mysubset t elements
                                                       else False

myintersection [] elements = []
myintersection (h:t) elements = if (elem h elements == True) then h : myintersection t elements
                                                			 else myintersection t elements

mydifference l1 l2 = sort (mydifference1 l1 l2 ++ mydifference1 l2 l1)
mydifference1 [] l2 = []
mydifference1 (h1:t1) l2 = if (elem h1 l2 == True) then mydifference1 t1 l2
                                                   else h1 : mydifference1 t1 l2

myunion l1 l2 = sort( (mydifference(l1 ++ l2) (myintersection l1 l2) ) ++ myintersection l1 l2)