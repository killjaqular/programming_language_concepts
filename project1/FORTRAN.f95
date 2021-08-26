! Author: name1, e-mail address
! Author: name2, e-mail address
! Course: CSE 4250, Summer 2021
! Project: Proj1, Spread of Epidemics

! This program compiles with gfortan version :
! GNU Fortran (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609

!  tpk.f95:  Knuth's TPK program in Fortran 95 (compiled by NAG F95)

program TPK

implicit none       ! no implicitly declared variables!
integer :: i
real :: y
real, dimension (0:10) :: A   !  declare array "A" elements 0..10

! Read in the values of the array "A"
read *, A           ! take advantage of an implicit loop

! In reverse order, apply "f" to each element of "A" and print
do i = UBOUND(A,dim=1), LBOUND(A,dim=1), -1
   y = f (A(i))
   if (y > 400.0) then
       print *, " too large"
   else
       print *, y
   end if
end do

contains

! f(x) = sqrt(|x|) + 5*x**3
function f (x); real f
   real, intent (in) :: x  ! "x" is an 'in' parameter of type real
   f = sqrt (abs(x)) + 5.0*x**3
end function f

end program TPK
