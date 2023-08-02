cmake_minimum_required(VERSION 3.22.0)

project(cpp-win32-template)

include(../cmake_macros/prac.cmake)

SETUP_WIN32_APP(cpp-win32-template "cpp-win32-template")

if(TARGET SharedUtils)
    target_link_libraries(cpp-win32-template SharedUtils)
endif()

# # Set the CWD of the VS 2022 Project
# set_target_properties(cpp-win32-template PROPERTIES
#     VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/assets"
# )