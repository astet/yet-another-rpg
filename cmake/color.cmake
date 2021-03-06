########################################################################################################################
#                                                                                                                      #
#                                                  Color Unix System for CMake                                         #
#                                                                                                                      #
########################################################################################################################

if (UNIX)
    string(ASCII 27 Esc)
    set(reset "${Esc}[m")
    set(bold "${Esc}[1m")
    set(red "${Esc}[31m")
    set(green "${Esc}[32m")
    set(yellow "${Esc}[33m")
    set(blue "${Esc}[34m")
    set(magenta "${Esc}[35m")
    set(cyan "${Esc}[36m")
    set(white "${Esc}[37m")
    set(boldred "${Esc}[1;31m")
    set(boldgreen "${Esc}[1;32m")
    set(boldyellow "${Esc}[1;33m")
    set(boldblue "${Esc}[1;34m")
    set(boldmagenta "${Esc}[1;35m")
    set(boldcyan "${Esc}[1;36m")
    set(boldwhite "${Esc}[1;37m")
else ()
    set(reset "")
    set(bold "")
    set(red "")
    set(green "")
    set(yellow "")
    set(blue "")
    set(magenta "")
    set(cyan "")
    set(white "")
    set(boldred "")
    set(boldgreen "")
    set(boldyellow "")
    set(boldblue "")
    set(boldmagenta "")
    set(boldcyan "")
    set(boldwhite "")
endif ()

macro(MSG_COLOR TYPE COLOR BOLD BEFORE STR AFTER)
    if (UNIX)
        message(${TYPE} "${BEFORE} " "${COLOR}${BOLD}${STR}${reset}" " ${AFTER}")
    elseif (WIN32)
        message(${TYPE} "${BEFORE} " "${STR}" " ${AFTER}")
    endif ()
endmacro()

macro(MSG_BLUE TYPE BEFORE STR AFTER)
    MSG_COLOR(${TYPE} "${blue}" "" "${BEFORE}" "${STR}" "${AFTER}")
endmacro()

macro(MSG_YELLOW_BOLD TYPE BEFORE STR AFTER)
    MSG_COLOR(${TYPE} "${boldyellow}" "" "${BEFORE}" "${STR}" "${AFTER}")
endmacro()

macro(MSG_WHITE_BOLD TYPE BEFORE STR AFTER)
    MSG_COLOR(${TYPE} "${boldwhite}" "" "${BEFORE}" "${STR}" "${AFTER}")
endmacro()

macro(MSG_CYAN_BOLD TYPE BEFORE STR AFTER)
    MSG_COLOR(${TYPE} "${boldcyan}" "" "${BEFORE}" "${STR}" "${AFTER}")
endmacro()

macro(MSG_BLUE_BOLD TYPE BEFORE STR AFTER)
    MSG_COLOR(${TYPE} "${boldblue}" "" "${BEFORE}" "${STR}" "${AFTER}")
endmacro()

