! Author:  Adonay Pichardo, apichardo2019@my.fit.edu
! Course:  CSE 4250, Fall 2021
! Project: Proj1, Spread of Epidemics

! This program compiles with gfortran version:
! GNU Fortran (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609

REAL*16 FUNCTION f_lambert(z)
! Newtonian approximation of the Lambert W function at z
    REAL*16, intent(IN) :: z ! Used as input

    REAL*16 :: small_change  ! Used to measure change between iterations
    REAL*16 :: approx        ! A variable used to approximate the value at z
    REAL*16 :: old_value     ! Holds last iteration's approx

    small_change = 0.0000000001 ! Level of accuracy
    approx       = 1.0          ! Initial guess
    DO WHILE (ABS(old_value - approx) > small_change)
        old_value = approx

        approx = approx - ((approx * exp(approx) - z) / (exp(approx) + approx * exp(approx)))
    END DO

    f_lambert = approx
END FUNCTION

REAL*16 FUNCTION f_gamma(alpha)
! Calculates the gamma value used to find total population infected
    REAL*16, intent(IN) :: alpha ! Used as input

    REAL*16 :: f_lambert

    f_gamma = 1 + f_lambert(-alpha * exp(-alpha)) / alpha
END FUNCTION

REAL*16 FUNCTION f_total_infected(alpha, population)
! Calculates the total population infected
    REAL*16, intent(IN) :: alpha
    REAL*16, intent(IN) :: population

    REAL*16 :: f_gamma

    f_total_infected = f_gamma(alpha) * population
END FUNCTION

!--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM--PROGRAM-

PROGRAM project1
! Simulation of the spread of a virus; given 'n' as the initial population,
! and 'a' as the number of people one infected person is in contact with.
! T               =          f_gamma(a) * n: Total number of people infected.
! infected_ration =                   T / n: Ratio of infected to not infected.
! f_lambert(z)    = Newtonian Approximation: Using Newtonian Approximation,
! we have estimated the value of the Lambert W function at the given z value.

    IMPLICIT NONE ! Do not allow implicit casting
    ! Functions
    REAL*16 :: f_total_infected ! Calculates total population infected

    ! Used for input
    REAL*16 :: n ! Initial population
    REAL*16 :: a ! Initial in contact with infected person

    ! Used for output
    REAL*16    :: T              ! Total population infected
    REAL*16    :: infected_ratio ! T/n
    INTEGER :: case_number    ! Current case number

    ! Used for control, auxiliary
    INTEGER :: flag ! Used to signal EOF has been read

!----------------------------------------------------------------------------------------------------------------------

    case_number = 0 ! Begin at first case
    DO
        ! Read input
        read (*, *, IOSTAT = flag) n, a
        IF (flag < 0) THEN ! If we have read EOF
            EXIT ! Break out of DO loop
        END IF

        ! Process data
        T = NINT(f_total_infected(a, n))
        infected_ratio = NINT((T / n) * 100.0)

        ! Print results
        case_number = case_number + 1
        print *, "Case", case_number, ":", NINT(T), NINT(infected_ratio), "%"
    END DO

END PROGRAM project1
