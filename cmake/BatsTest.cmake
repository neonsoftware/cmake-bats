##
# @brief Discovers and registers tests from BATS scripts for use with CTest.
#
# This function extracts test names defined in the BATS script files and registers them as CTest tests. Each test is
# associated with properties for passing, failing, and skipping, provided the version of CMake supports them.
#
# @param SCRIPT_FILES List of BATS script files to process.
#
# Requirements:
# - CMake version 3.16 or later is required for `SKIP_REGULAR_EXPRESSION`.
#
# Limitations:
# - BATS test case names cannot include characters that CMake would expand (e.g., `${}`).
# - BATS test case names cannot contain regular expression syntax, as they may be mangled by the `--filter` option in BATS.
# - Test case names must be globally unique.
# - This function does not account for BATS test tags.
# - The alternate test naming syntax (e.g., `function foo() {  # @test`) is not supported and may break this function.
#
function(bats_discover_tests SCRIPT_FILES)
    foreach (SCRIPT_FILE IN LISTS SCRIPT_FILES)
        if(NOT "${SCRIPT_FILE}" STREQUAL "")
            file(STRINGS ${SCRIPT_FILE} TEST_LINES REGEX ".*@test.*")
            foreach (TEST_LINE IN LISTS TEST_LINES)
                string(FIND ${TEST_LINE} "\"" firstQuoteIndex)
                string(FIND ${TEST_LINE} "\"" secondQuoteIndex REVERSE)
                MATH(EXPR firstQuoteIndex "${firstQuoteIndex}+1")
                MATH(EXPR nameLength "${secondQuoteIndex}-${firstQuoteIndex}")
                string(SUBSTRING ${TEST_LINE} ${firstQuoteIndex} ${nameLength} TEST_NAME)

                add_test(NAME ${TEST_NAME}
                        COMMAND ${bats_SOURCE_DIR}/bin/bats --formatter tap --filter "^${TEST_NAME}\$" ${SCRIPT_FILE})
                set_tests_properties("${TEST_NAME}" PROPERTIES
                        PASS_REGULAR_EXPRESSION "1\.\.1[\r\n\t ]+ok 1 ${TEST_NAME}[\r\n\t ]+$"
                        FAIL_REGULAR_EXPRESSION "1\.\.1[\r\n\t ]+not ok 1 ${TEST_NAME}[\r\n\t ]+$"
                        SKIP_REGULAR_EXPRESSION "1\.\.1[\r\n\t ]+ok 1 ${TEST_NAME} # skip[\r\n\t ]+$")
            endforeach()
        endif()
    endforeach()
endfunction()
