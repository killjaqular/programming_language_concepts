program helloworld

	implicit none
	integer :: stdin  = 5
	integer :: stdout = 6
	integer, dimension(0:2) :: input_integers
	real,    dimension(0:2) :: input_reals

	integer :: i
	do i = UBOUND(input_integers, dim=1), LBOUND(input_integers, dim=1), -1
		read (*, *) input_integers(i), input_reals(i)
	end do

	do i = UBOUND(input_integers, dim=1), LBOUND(input_integers, dim=1), -1
		write (stdout, stdout) input_integers(i), input_reals(i)
	end do

	print *,'Hello World!'

end program helloworld
