program gcd
  
  use gcdfunctions
  implicit none
  integer (kind=4) :: a, b

  real (kind=4) :: randa, randb

  call random_seed()
  !Generate two random real numbers between 0 and 1
  call random_number(randa)
  call random_number(randa)

  a = 1 + FLOOR(20 * randa) 
  b = 1 + FLOOR(20 * randb)

  ! Call functions
  write (6, '(a,i2,a,i2,a,i2)') 'Iterative GCD(',a, ',', b, ')= ', iterativeGCD(a,b)
  write (6, '(a,i2,a,i2,a,i2)') 'Recursive GCD(',a, ',', b, ')= ', recursiveGCD(a,b) 

end program gcd
