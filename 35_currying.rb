p "Currying in Ruby"

#  http://www.khelll.com/blog/ruby/ruby-currying/

#  f(x,y,z) = 4*x+3*y+2*z
#  Currying means that we can rewrite the function as a composition of 3 functions
#  (a function for each param): f(x)(y)(z) = 2*z+(3*y+(4*x))

sum = lambda do |f, a, b|
  s = 0; a.upto(b) {|n| s += f.(n) } ; s
end

sum.call(lambda{|x| x**2}, 1, 5) # pass directly a function # => 55
sum_of_squares = lambda{|x,y| sum.(lambda{|x| x**2}, x, y)} # define as new lambda
sum_of_squares.(1,5) # equivalent to sum_of_squares.call(1,5) # => 55

p "Ruby 1.9.2 Proc#curry method"

currying = sum.curry
sum_of_squares = currying.(lambda{|x| x**2})
sum_of_squares.(1,5) # => 55