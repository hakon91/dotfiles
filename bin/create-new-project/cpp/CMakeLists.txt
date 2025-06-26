cmake_minimum_required(VERSION 3.22.0)
project(project-name-to-be-repalced VERSION 0.1.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Define the executable target
add_executable(${PROJECT_NAME})

# Include directories
target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${CMAKE_SOURCE_DIR}/include
)

# Source files
file(GLOB_RECURSE SRC_FILES "${CMAKE_SOURCE_DIR}/src/*.cpp")

# Add source files to the target
target_sources(${PROJECT_NAME}
    PRIVATE
        ${SRC_FILES}
)

# Optional: Enable warnings and debugging symbols in debug mode
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic -g)
endif()

# Optional: Install the target (adjust paths as necessary)
install(TARGETS ${PROJECT_NAME} DESTINATION bin)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/include/ DESTINATION include)

