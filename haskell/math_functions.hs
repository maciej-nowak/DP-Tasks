--Power function
pow::(Int,Int)->Int
pow(a,n) = if n==0 then 1
               else a*pow(a, n-1)

--GCD function
gcd::(Float,Float)->Float
gcd(a,b) = if a==b then a 
                          else if a>b then gcd(a-b,b)
                          else gcd(a,b-a)

--LCM function
lcm::(Float,Float)->Float
lcm(a,b) = a/lcm(a,b)*b

--Fibonacci function
fib::Int->Int
fib(n) = if n<3 then 1
			else fib(n-2)+fib(n-1)

--Is triangle function
tri::(Float,Float, Float)->Bool
tri(a,b,c) = if a+b>c && a+c>b && b+c>a then True
		else False
 
 