! Program #4
! This program reads in from a file a matrix of destinations and distances
! Then it finds the shortest route to go to each location and end back at the start
! CS320
! 02 November 2020
! @author Christian James cssc2633

! PROGRAM P4
!             Traveling Salesman Problem in FORTRAN 95
PROGRAM P4

IMPLICIT NONE

    ! Variable declarations
    INTEGER :: cities, i, j, best_distance
    INTEGER, DIMENSION(:,:), allocatable :: d_table
    INTEGER, DIMENSION(:), allocatable :: path, best_path
    CHARACTER (len = 40), DIMENSION(:), allocatable :: city_list
    CHARACTER (len = 40) :: fileName

    ! Print ID
    WRITE (*,200) "Program #4, cssc2633, Christian James"

    ! Get File name
    WRITE (*,200) "Input File Name:"
    read*, fileName

    ! Open the file and read number of cities
    open (1, file = fileName, status='old')
    read (1,*) cities

    ! Allocate memory for all needed arrays
    allocate (city_list(cities))
    allocate (d_table(cities, cities))
    allocate (path(cities))
    allocate (best_path(cities))

    ! Fill in arrays from data file
    DO i = 1, cities
        read(1,200) city_list(i)
        DO j = 1, cities
            read(1,100) d_table(i, j)
        END DO
    END DO
    path = (/ (I, I = 1, cities) /)
    best_path = (/ (I, I = 1, cities) /)
    DO i = 1, cities-1
        best_distance = best_distance + d_table(i, i+1)
    END DO
    best_distance = best_distance + d_table(cities, 1)
    close(1)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! Use recursion to find minimal distance
    call permute(2,cities)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !Print formatted output
    print*
    DO i = 1, cities-1
        WRITE (*,300) TRIM(city_list(best_path(i))), TRIM(city_list(best_path(i+1))), d_table(best_path(i), best_path(i+1))
    END DO
    WRITE (*,300) TRIM(city_list(best_path(cities))), TRIM(city_list(best_path(1))), d_table(best_path(cities), best_path(1))
    print*
    WRITE (*,400) "Best distances:", best_distance
    deallocate (city_list)
    deallocate (d_table)
                
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Format labels
100 FORMAT (I6)
200 FORMAT (A)
300 FORMAT (A, " to ", A, " --", I5, "  miles")
400 FORMAT (A, I6)

CONTAINS
!Permute function
RECURSIVE SUBROUTINE permute(first, last)
! Declare intent of parameter variables
INTEGER :: first, last

INTEGER :: i, temp, distance
        IF(first == last)  THEN
            distance = d_table(1,path(2))
            DO i=2, last-1           
                distance = distance + d_table(path(i),path(i+1)) 
            END DO
            distance = distance + d_table(path(last),path(1))
            IF(distance < best_distance) THEN
                best_distance = distance
                DO i=2, cities
                    best_path(i) = path(i)
                END DO
            END IF
            
        ELSE
            DO i=first, last
                temp = path(first)
                path(first) = path(i)
                path(i) = temp

                call permute(first+1,last)
         
                temp = path(first)
                path(first) = path(i)
                path(i) = temp
            END DO
        END IF
END SUBROUTINE permute 

END PROGRAM P4
