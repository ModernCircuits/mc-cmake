# SPDX-License-Identifier: BSL-1.0

cmake_minimum_required(VERSION 3.15)

add_library(mc_compiler_options INTERFACE)
add_library(mc::compiler_options ALIAS mc_compiler_options)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(mc_compiler_options INTERFACE "/permissive-")
endif()

if(MODERNCIRCUITS_ENABLE_ASAN AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(mc_compiler_options INTERFACE -fsanitize=address -fsanitize-address-use-after-scope -O1 -g -fno-omit-frame-pointer)
    target_link_libraries(mc_compiler_options INTERFACE -fsanitize=address -fsanitize-address-use-after-scope -O1 -g -fno-omit-frame-pointer)
endif()

if(MODERNCIRCUITS_ENABLE_UBSAN AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(mc_compiler_options INTERFACE -fsanitize=undefined -O1 -g -fno-omit-frame-pointer)
    target_link_libraries(mc_compiler_options INTERFACE -fsanitize=undefined -O1 -g -fno-omit-frame-pointer)
endif()

if(MODERNCIRCUITS_ENABLE_MSAN AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(mc_compiler_options INTERFACE -fsanitize=memory -O1 -g -fno-omit-frame-pointer)
    target_link_libraries(mc_compiler_options INTERFACE -fsanitize=memory -O1 -g -fno-omit-frame-pointer)
endif()

if(MODERNCIRCUITS_ENABLE_TSAN AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(mc_compiler_options INTERFACE -fsanitize=thread -O1 -g -fno-omit-frame-pointer)
    target_link_libraries(mc_compiler_options INTERFACE -fsanitize=thread -O1 -g -fno-omit-frame-pointer)
endif()
