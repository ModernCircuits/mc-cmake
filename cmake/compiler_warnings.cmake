# SPDX-License-Identifier: BSL-1.0

cmake_minimum_required(VERSION 3.15)

add_library(mc_compiler_warnings INTERFACE)
add_library(mc::compiler_warnings ALIAS mc_compiler_warnings)

if((CMAKE_CXX_COMPILER_ID STREQUAL "MSVC") OR (CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "MSVC"))
    target_compile_options(mc_compiler_warnings INTERFACE /W4)
    if (MODERNCIRCUITS_ENABLE_WERROR)
        target_compile_options(mc_compiler_warnings INTERFACE /WX)
    endif (MODERNCIRCUITS_ENABLE_WERROR)
else ()
    target_compile_options(mc_compiler_warnings
        INTERFACE
            -Wall
            -Wextra
            -Wpedantic

            -Wcast-align
            -Wconversion
            -Woverloaded-virtual
            -Wreorder
            -Wshadow
            -Wsign-compare
            -Wsign-conversion
            -Wstrict-aliasing
            -Wswitch-enum
            -Wuninitialized
            -Wunreachable-code
            -Wunused-parameter
            -Wzero-as-null-pointer-constant
            -Wredundant-decls

            $<$<CXX_COMPILER_ID:GNU>:
                -Wlogical-op
            >

            $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>>:
                -Wbool-conversion
                -Wconditional-uninitialized
                -Wconstant-conversion
                -Wextra-semi
                -Winconsistent-missing-destructor-override
                -Wint-conversion
                -Wnullable-to-nonnull-conversion
                -Wshadow-all
                -Wshift-sign-overflow
                -Wshorten-64-to-32
                -Wunused-private-field
            >

            $<$<CXX_COMPILER_ID:AppleClang>:
            >

    )
    if (MODERNCIRCUITS_ENABLE_WERROR)
        target_compile_options(mc_compiler_warnings INTERFACE -Werror)
    endif (MODERNCIRCUITS_ENABLE_WERROR)
endif ()
