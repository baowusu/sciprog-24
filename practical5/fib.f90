module fib
  contains
  subroutine fibonacci(a,b)
    integer (kind=4), intent(inout) :: a,b
    integer (kind=4) :: next

    next = a+b
    b=a; a=next
  end subroutine fibonacci
end module

program fibonaccinacci
  use fib
  implicit none
  integer (kind=4) :: n,i,f1=1,f0=0

! Get user to enter a number
    write(6,*) 'Enter a positive integer'
    read(5,*) n

! Check the number is positive, terminate if not
    if (n .lt. 1) then
      write(6,*) 'The number is not positive'
      stop
    endif

    write(6,*) 'The fibonaccinacii sequence is : '
    write(6,'(i0,a,i0,a)',advance='NO') f0,', ',f1,', '

    do i=2,n
       call fibonacci(f1,f0);            ! get next #

       write(6,'(i0,a,i0,a)',advance='NO') f1,', '
       if (mod((i+1),10) .eq. 0) write(6,*)         ! Put in a few line breaks
    end do
 ! Last term
    !call fibonacci(f1,f0);
    !write(6,'(i0)') f1

end program fibonaccinacci
