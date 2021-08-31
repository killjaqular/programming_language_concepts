FUNCTION f_lambert(z)
	REAL, intent(IN) :: z

	REAL :: approx

	approx = 1
	DO iteration = 1, 100, 1
		approx = approx - ((approx * exp(approx) - z) / (exp(approx) + approx * exp(approx)))
	END DO

	f_lambert = approx
END FUNCTION

FUNCTION f_gamma(alpha)
	REAL, intent(IN) :: alpha

	f_gamma = 1 + f_lambert(-alpha * exp(-alpha)) / alpha
END FUNCTION

FUNCTION f_total_infected(alpha, population)
	REAL,    intent(IN) :: alpha
	INTEGER, intent(IN) :: population

	f_total_infected = f_gamma(alpha) * population
END FUNCTION

!--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM-

PROGRAM project1

! TODO: Write formula here

	IMPLICIT NONE

	REAL :: f_lambert        ! Lamber W function
	REAL :: f_gamma          ! Gamma value
	REAL :: f_total_infected ! Calculates total population infected

	INTEGER :: n
	REAL    :: a
	INTEGER :: T
	REAL    :: infected_ratio

	INTEGER :: case_number
	INTEGER :: flag

!--------------------------------

	case_number = 0
	DO
		! Read input
		read (*, *, IOSTAT = flag), n, a
		IF (flag < 0) THEN
			EXIT
		END IF

		! Process data
		T = f_total_infected(a, n)
		infected_ratio = (T / n) * 100

		! Print result
		case_number = case_number + 1
		print *, "Case", case_number, ":", T, infected_ratio, "%"
		
	END DO

END PROGRAM project1
