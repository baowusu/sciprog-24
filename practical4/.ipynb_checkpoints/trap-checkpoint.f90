module consts
    integer (kind=4), parameter :: N=12
    real (kind=4) :: pi
    real(kind=4) :: TanArr(0:N)
end module consts

module subroutines
   interface
     subroutine degtorad(deg, rad)
       real (kind=4), intent(in) :: deg
       real (kind=4), intent(out) :: rad
     end subroutine degtorad

    function traprule() result(area)
       use consts
    end function traprule
   end interface
end module subroutines

program Trap
    use consts
    use subroutines
    implicit none
    integer (kind=4) :: i
    real (kind=4) :: a = 0.0, b_deg = 60.0
    real (kind=4) :: area, radian
    real (kind=4) :: deg

    ! Convert b=pi/3 to radians
    pi = atan(1.0) * 4.0

    ! Calculate the values of TanArr(xi)=f(xi) i=0,1,...,12
    do i = 0, N
        deg = i * 5.0
        call degtorad(deg, radian)
        TanArr(i) = tan(radian)
        write(6, *) 'TanArr[', i, '] = ', TanArr(i)
    end do

    area = traprule()

    ! Approximated result
    write(6, *) 'Trapezoidal result is ', area
    ! Real result
    write(6, *) 'Real result is ', log(2.0)

    stop
end program Trap

subroutine degtorad(deg, rad)
    real (kind=4), intent(in) :: deg
    real (kind=4), intent(out) :: rad
    real (kind=4) :: pi = 3.1415927
    rad = (pi * deg) / 180.0
end subroutine degtorad

function traprule() result(area)
    use consts
    real(kind=4) :: area, mult_rad, b_rad
    integer (kind=4) :: i

    call degtorad(60.0, b_rad)

    area = 0.0
    write(6, *) 'Initial area (sum at x=(0) and x(12)) = ', area
    
    ! Calculate the area at pts x1, x2, ..., x11 and add them up
    do i = 1, N-1
        area = area + 2.0 * TanArr(i)
        write(6, *) 'New area after adding TanArr[', i, '] = ', area
    end do
    
    !Multiply area by (pi/3)/2(12) after converting it to radians
    call degtorad(((b_deg - a) / (2 * N)), mult_rad)
    area = mult_rad * area
end function traprule

