module parse_release 
contains
    function get_os() result(os_name)
        character(len=15) :: line, key, value, os_name
        integer :: ios, eq_pos
        os_name = "Unknown"

        open(10, file="/etc/os-release", status="old", action="read", iostat=ios)
        if (ios /= 0) then
            print *, "error"
            close(10)
            return
        end if

        do
            read(10, '(A)', iostat=ios) line
            if (ios /= 0) exit

            eq_pos = index(line, "=")
            if (eq_pos > 0) then
                key = trim(line(1:eq_pos-1))
                value = trim(line(eq_pos+1:))

                ! Убираем кавычки, если есть
                if (len_trim(value) > 1) then
                    if ((value(1:1) == '"' .and. value(len_trim(value):len_trim(value)) == '"') .or. &
                        (value(1:1) == '''' .and. value(len_trim(value):len_trim(value)) == '''')) then
                        value = value(2:len_trim(value)-1)
                    end if
                end if

                if (key == "NAME") then
                    os_name = value
                    exit
                end if
            end if
        end do

        close(10)
    end function get_os
    
  character function get_version() result(os_ver)
        character(len=4) :: line, key, value
        integer :: ios, eq_pos

        open(10, file="/etc/os-release", status="old", action="read", iostat=ios)
        if (ios /= 0) then
            print *, "error"
            close(10)
            return
        end if

        do
            read(10, '(A)', iostat=ios) line
            if (ios /= 0) exit

            eq_pos = index(line, "=")
            if (eq_pos > 0) then
                key = trim(line(1:eq_pos-1))
                value = trim(line(eq_pos+1:))

                ! Убираем кавычки, если есть
                if (len_trim(value) > 1) then
                    if ((value(1:1) == '"' .and. value(len_trim(value):len_trim(value)) == '"') .or. &
                        (value(1:1) == '''' .and. value(len_trim(value):len_trim(value)) == '''')) then
                        value = value(2:len_trim(value)-1)
                    end if
                end if

                if (key == "VERSION") then
                    read(value, *) os_ver
                    exit
                end if
            end if
        end do

        close(10)
    end function get_version
    
    function read_os_release() 
        character(len=256) :: line, key, value
        integer :: ios, eq_pos
        open(unit=10, file="/etc/os-release", status="old", action="read", iostat=ios)

        if (ios /= 0) then
            print *, "Не удалось открыть /etc/os-release"
            stop
        end if

        print *, "Содержимое /etc/os-release:"
        do
            read(10, '(A)', iostat=ios) line
            if (ios /= 0) exit

        ! Поиск знака '='
                eq_pos = index(line, "=")
                if (eq_pos > 0) then
                    key = line(1:eq_pos-1)
                    value = line(eq_pos+1:)
            
             ! Удаляем кавычки, если есть
                if (value(1:1) == '"' .or. value(1:1) == '''') then
                    value = value(2:len_trim(value)-1)
                end if

                print *, trim(key), " = ", trim(value)
            end if
        end do

        close(10)
    end function read_os_release

end module parse_release 
