newtype Parser a = Parser (String -> [(a, String)])

parse :: Parser a -> String -> [(a, String)]
parse (Parser p) input = p input

failure :: Parser Char
failure = Parser (\input -> [])

instance Monad Parser where
    return x = Parser (\input -> [(x, input)])
    (Parser p) >>= f =
        Parser (\input -> case p input of
                             [] -> []
                             [(x, input')] -> case f x of
                                                  Parser p' -> p' input')

item :: Parser Char
item = Parser (\input -> case input of
                            [] -> []
                            (x:xs) -> [(x, xs)])

sat :: (Char -> Bool) -> Parser Char 
sat p = do x <- item 
           if p x then return x else failure

digit :: Parser Char
digit = sat (`elem` ['0'..'9'])

char :: Char -> Parser Char
char c = sat (==c)

Parser p +++ Parser q = Parser $
    \input -> case p input of
                  [] -> q input
                  [(v, out)] -> [(v, out)]

-----------------------------------------------------------

--expr ::= term '+' expr | term
--term ::= factor '*' term | factor
--factor ::= digit | '(' expr ')'
--digit ::= '0' | '1' | ... | '9'

term :: Parser Int 
term = do f <- factor
          do char '*'
             t <- term
             return (f * t)
           +++
             return f

expr :: Parser Int
expr = do t <- term
          do char '+'
             e <- expr
             return (t + e)
            +++
             return t

factor :: Parser Int
factor = do d <- digit
            return (read [d])
           +++
            do char '('
               e <- expr
               char ')'
               return e
eval :: String -> Int

eval input = case parse expr input of
              
              [(n, [])] -> n
              
              [(_, out)] -> error ("nieskonsumowane " ++ out)
              
              [] -> error "bledne wejscie"	

a :: IO (Char, Char) 
a = do x <- getChar 
       getChar 
       y <- getChar 
       return (x, y)		   
			   
