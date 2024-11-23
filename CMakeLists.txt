cmake_minimum_required(VERSION 3.22)
get_filename_component(PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME_WE)
project(${PROJECT_NAME} LANGUAGES C CXX ASM)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CWD ${CMAKE_SOURCE_DIR})
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CWD}/cmake)
set(INC ${CWD}/inc)
set(SRC ${CWD}/src)
set(TMP ${CWD}/tmp)

file(GLOB_RECURSE C
    "${SRC}/*.c*" "${TMP}/*.h*"
)
file(GLOB_RECURSE H
    "${INC}/*.h*" "${TMP}/*.h*"
)

include_directories(
    ${INC} ${TMP}
    "${CWD}/hw/${HW}/Core/Inc"
    "${CWD}/hw/${HW}/Drivers/CMSIS/Include"
    "${CWD}/hw/${HW}/Drivers/CMSIS/Device/ST/STM32F4xx/Include"
    "${CWD}/hw/${HW}/Drivers/STM32F4xx_HAL_Driver/Inc"
)

add_compile_definitions(
)

find_package(FLEX  REQUIRED)
find_package(BISON REQUIRED)

file(GLOB L CONFIGURE_DEPENDS ${SRC}/*.lex)
file(GLOB Y CONFIGURE_DEPENDS ${SRC}/*.yacc)
get_filename_component(lex  ${L} NAME_WE)
get_filename_component(yacc ${Y} NAME_WE)
message(L=${L} " " ${lex})
message(Y=${Y} " " ${yacc})
 FLEX_TARGET(lex  ${L} ${TMP}/${lex}.lexer.cpp)
BISON_TARGET(yacc ${Y} ${TMP}/${yacc}.parser.cpp
          DEFINES_FILE ${TMP}/${yacc}.parser.hpp)
message(lexer=${LEX_lex_OUTPUTS})
message(parser=${BISON_yacc_OUTPUTS})

add_executable(${CMAKE_PROJECT_NAME}
    ${C} ${H} 
    ${LEX_lex_OUTPUTS} ${BISON_yacc_OUTPUTS}
)

target_link_libraries(${PROJECT_NAME})
