module gcdfunctions
  implicit none
  contains
     function iterativeGCD(a,b) result(answer)
       implicit none
       integer (kind=4), intent(in) :: a, b
       integer (kind=4) :: temp, tempa, tempb, answer

       tempa=a
       tempb=b
      
       do while(tempb .ne. 0)
         temp=tempb
         tempb=mod(tempa, tempb)
         tempa=temp
       end do

       answer=tempa

       return
     end function iterativeGCD
     recursive function recursiveGCD(a,b) result(answer)
       implicit none
       integer (kind=4), intent(in) :: a,b
       integer (kind=4) :: answer

       if(b .eq. 0) then
          answer=a 
       else
          answer=recursiveGCD(b, mod(a,b))
       end if

       return
       end function recursiveGCD
end module gcdfunctions
