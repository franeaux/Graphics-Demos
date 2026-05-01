cmake_minimum_required(VERSION 3.23)

project(Base)

add_library(Base)

find_package(Vulkan REQUIRED)

set(BUILD_TESTING OFF)
set(BUILD_GMOCK OFF)
set(EFFCEE_BUILD_SAMPLES OFF)
set(EFFCEE_BUILD_TESTS OFF)
set(GLFW_BUILD_TESTS OFF)
set(GLFW_BUILD_EXAMPLES OFF)
set(GLFW_INSTALL OFF)
set(GLM_BUILD_TESTS OFF)
set(INSTALL_GTEST OFF)
set(SHADERC_SKIP_EXAMPLES ON)
set(SHADERC_SKIP_TESTS ON)
set(SPIRV_SKIP_TESTS ON)

add_subdirectory(
    ${CMAKE_CURRENT_SOURCE_DIR}/../sources/glfw ./build/glfw
)

add_subdirectory(
    ${CMAKE_CURRENT_SOURCE_DIR}/../sources/fastgltf-0.7.2 ./build/fastgltf-0.7.2
)
add_subdirectory(
    ${CMAKE_CURRENT_SOURCE_DIR}/../sources/shaderc ./build/shaderc
)

add_subdirectory(
    ${CMAKE_CURRENT_SOURCE_DIR}/../sources/glm ./build/glm
)

target_include_directories(Base
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/stb
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/shaderc/libshaderc/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/glfw/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/fastgltf-0.7.2/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../sources/glm
)

target_link_libraries(Base
    PUBLIC
        glm::glm-header-only
        glfw
        Vulkan::Vulkan
        fastgltf
        shaderc
)

target_compile_features(Base
    PRIVATE
        cxx_std_20
)

target_sources(Base
    PUBLIC
        camera.cpp
        command.cpp
        device.cpp
        init.cpp
        memory.cpp
        parser.cpp
        shader.cpp
        imgui/imgui.cpp
        imgui/imgui_demo.cpp
        imgui/imgui_draw.cpp
        imgui/imgui_impl_glfw.cpp
        imgui/imgui_impl_vulkan.cpp
        imgui/imgui_tables.cpp
        imgui/imgui_widgets.cpp

    PUBLIC
        FILE_SET baseHeaders
        TYPE HEADERS
        FILES
            camera.h
            command.h
            device.h
            init.h
            memory.h
            parser.h
            shader.h
            imgui/imconfig.h
            imgui/imgui.h
            imgui/imgui_impl_glfw.h
            imgui/imgui_impl_vulkan.h
            imgui/imgui_internal.h
            imgui/imstb_rectpack.h
            imgui/imstb_textedit.h
            imgui/imstb_truetype.h
)
