--Definition of operator >>
(>>^) f g = f >>= return
            g >>= return

--Sum, product and difference of two numbers
dwie_liczby = do 
				putStr "Type A: "
				a <- getLine
				let x = read a
				putStr "Type B: "
				b <- getLine
				let y = read b
				putStr ("SUM = " ++ show (x+y) ++ "\n")
				putStr ("DIFFERENCE = " ++ show (x-y) ++ "\n")
				putStr ("PRODUCT = " ++ show (x*y) ++ "\n")

--Initials
firstLetter (x:xs) = return x

inicjaly = do
				putStr "Type name: "
				a <- getLine
				putStr "Type surname: "
				b <- getLine	
				putStr ("INITIALS: " ++ firstLetter a ++ "." ++ firstLetter b ++ ".")

--Address and Email classes
class Address a where
      mail :: a -> String -> Bool

data Email = String
instance Address Email where
         mail a "@st.amu.edu.pl" = True
         mail _ _ = False
