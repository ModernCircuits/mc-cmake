# SPDX-License-Identifier: BSL-1.0

cmake_minimum_required(VERSION 3.15)

add_library(mc_coverage INTERFACE)
add_library(mc::coverage ALIAS mc_coverage)

if(MODERNCIRCUITS_ENABLE_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
  target_compile_options(mc_coverage INTERFACE -O0 -g --coverage)
  target_link_libraries(mc_coverage INTERFACE --coverage)
  target_link_options(mc_coverage INTERFACE --coverage)
endif()
