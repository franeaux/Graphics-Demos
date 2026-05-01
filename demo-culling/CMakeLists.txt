cmake_minimum_required(VERSION 3.23)

project(Demo_Culling)

find_package(Vulkan REQUIRED)

add_executable(Demo_Culling)

target_include_directories(Demo_Culling
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/../base/
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/stb
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/shaderc/libshaderc/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/glfw/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/fastgltf-0.7.2/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/glm
)

add_library(Base STATIC IMPORTED)

message("current src dir: ${CMAKE_CURRENT_SOURCE_DIR}")

set_target_properties(Base PROPERTIES
    IMPORTED_LOCATION  "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/libBase.a"
    IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/libBase.a"
    IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/libBase.a"
)

add_library(fastgltf STATIC IMPORTED)

set_target_properties(fastgltf PROPERTIES
    IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/fastgltf-0.7.2/libfastgltf.a"
    IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/fastgltf-0.7.2/libfastgltf.a"
    IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/fastgltf-0.7.2/libfastgltf.a"
)

add_library(glfw STATIC IMPORTED)

set_target_properties(glfw PROPERTIES
    IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/glfw/src/libglfw3.a"
    IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/glfw/src/libglfw3.a"
    IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/glfw/src/libglfw3.a"
)

add_library(shaderc STATIC IMPORTED)

set_target_properties(shaderc PROPERTIES
    IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/shaderc/libshaderc/libshaderc_combined.a"
    IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/shaderc/libshaderc/libshaderc_combined.a"
    IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/../base/build/build/shaderc/libshaderc/libshaderc_combined.a"
)

target_link_libraries(Demo_Culling
    PRIVATE
        Base
        fastgltf
        vulkan
        tbb
        glfw
        shaderc
)

target_compile_features(Demo_Culling
    PRIVATE
        cxx_std_23
)

target_sources(Demo_Culling
    PRIVATE
        culling.cpp
)
