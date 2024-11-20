program PersonData

   !type declaration
   type Person
      character(len = 100) :: namesurname
      integer :: age
      real (kind=4) :: height, weight
   end type Person

   !type variables
   type(Person), target :: person1=Person("John Smith", 50, 165.78, 80.5)
   !pointer to type structure
   type(Person), pointer :: personptr
   personptr=>person1

   !Printing
   write(6,*) 'Displaying all information'
   write(6,*) 'Name= ', person1%namesurname
   write(6,*) 'Age= ', personptr%age, 'Weight= ', person1%weight, 'Height= ', person1%height

end program PersonData
