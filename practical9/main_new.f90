include 'magic_square_new.fh'

program magsq
    use msquare
    implicit none
    integer (kind=4) n, i, ierr
    integer (kind=4), allocatable :: magicSquare(:,:)
    character (len=6) :: text
    character (len=100) :: filenam, line

    ! Open the file
    write(6, *) ' Enter the file name with the square matrix '
    read(5, *) filenam

    ierr = 0
    open(unit=1, file=filenam, form='FORMATTED', access='SEQUENTIAL', &
         action='READ', status='OLD', iostat=ierr)

    if (ierr /= 0) then
        write(6, *) 'Sorry cannot find file ', trim(filenam)
        goto 20
    end if

    ! First line has n
    n = 0
    do while (ierr == 0)
        read(1, *, iostat=ierr) line
        n = n + 1
    end do
    n = n - 1
    rewind(unit=1)

    if (n <= 0) goto 10
    read(1, *, iostat=ierr) n

    ! Allocating a matrix for storing the magic square
    allocate(magicSquare(n, n))

    ! Read in the rows from each line
    do i = 1, n
        read(1, *, iostat=ierr) magicSquare(i, :)
    end do

    if (ierr /= 0) then
        write(6, *) ' Cannot read in matrix correctly stopping! '
        goto 10
    endif

    if (isMagicSquare(magicSquare, n)) then
        text = 'is'
    else
        text = 'is NOT'
    endif
    write(6, *) 'This square ', trim(text), ' magic.'

    deallocate(magicSquare)
    close(unit=1, status='KEEP')
    stop

10 continue
    write(6, *) 'Invalid matrix size.'
    stop

20 continue
    stop

end program magsq

