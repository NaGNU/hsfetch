program rfetch
    use parse_release 
    implicit none
                
    print *,"OS: ", get_os() 
    print *, "VER: ", get_version() 
end program rfetch
