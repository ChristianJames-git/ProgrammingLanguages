PROGRAM untitled1
IMPLICIT NONE
    INTEGER :: cities, i, j
    INTEGER, DIMENSION(:,:), allocatable :: distances
    CHARACTER (len = 40), DIMENSION(:), allocatable :: city_list
    CHARACTER (len = 40) :: fileName
    INTEGER, DIMENSION(:), allocatable :: path

    print*, "Input File Name: "
    read*, fileName

    open (1, file = fileName, status='old')
    read (1,*) cities
    write (*,*) cities

    allocate (city_list(cities))
    allocate (distances(cities, cities))
    DO i = 1, cities
        read(1,200) city_list(i)
        DO j = 1, cities
            read(1,*) distances(i, j)
        END DO
    END DO
    path = (/ (I, I = 1, cities) /)
    close(1)
    print*, path(3)
    !DO i = 1, cities
    !    DO j = 1, cities
    !        PRINT*, distances(i, j)
    !    END DO
    !END DO

    100 FORMAT (I6)
    200 FORMAT (A)
    300 FORMAT (A, " to ", A, " -- ", I6, " miles")
    write(*,300) TRIM(city_list(1)), TRIM(city_list(2)), distances(1,2)

    deallocate (city_list)
    deallocate (distances)
END program untitled1