cmake_minimum_required(VERSION 3.1)

project(SSV NONE)
include(UseLATEX)

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/mTex 
    DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
)

add_custom_target(
    writegitid ALL
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/write-gitid.sh
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)

add_latex_document(
    SSV.tex
    FORCE_PDF
    IMAGE_DIRS images_ssp
    DEPENDS writegitid
)
