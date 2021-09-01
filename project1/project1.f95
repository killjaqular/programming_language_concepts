FUNCTION f_lambert(z)
! Newtonian approximation of the Lambert W function at z
	REAL, intent(IN) :: z ! Used as input

	REAL :: approx ! A variable used to approximate the value at z

	approx = 1 ! Initial guess
	DO iteration = 1, 1000, 1 ! Use 1000 iterations for precision
		approx = approx - ((approx * exp(approx) - z) / (exp(approx) + approx * exp(approx)))
	END DO

	f_lambert = approx ! Return the estimated value
END FUNCTION

FUNCTION f_gamma(alpha)
! Calculates the gamma value used to find total population infected
	REAL, intent(IN) :: alpha ! Used as input

	f_gamma = 1 + f_lambert(-alpha * exp(-alpha)) / alpha
END FUNCTION

FUNCTION f_total_infected(alpha, population)
! Calculates the total population infected
	REAL,    intent(IN) :: alpha
	INTEGER, intent(IN) :: population

	f_total_infected = f_gamma(alpha) * population
END FUNCTION

!--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM-

PROGRAM project1
! 
! 
! 
	IMPLICIT NONE ! Do not allow implicit casting
	! Functions
	REAL    :: f_lambert         ! Lamber W function
	REAL    :: f_gamma           ! Gamma value
	REAL    :: f_total_infected  ! Calculates total population infected

	! Used for input
	INTEGER :: n                 ! Initial population
	REAL    :: a                 ! Initial in contact with infected person

	! Used for output
	REAL    :: T                 ! Total population infected
	REAL    :: infected_ratio    ! T/n
	INTEGER :: case_number       ! Current case number

	! Used for control, auxiliary
	INTEGER :: flag              ! Used to signal EOF has been read

!----------------------------------------------------------------------------------------------------------------------

	case_number = 0 ! Begin at first case
	DO
		! Read input
		read (*, *, IOSTAT = flag), n, a
		IF (flag < 0) THEN ! If we have read EOF
			EXIT ! Break out of DO loop
		END IF

		! Process data
		T = f_total_infected(a, n)
		infected_ratio = (T / n) * 100.0

		! Print results
		case_number = case_number + 1
		print *, "Case", case_number, ":", T, infected_ratio, "%"
	END DO

END PROGRAM project1
