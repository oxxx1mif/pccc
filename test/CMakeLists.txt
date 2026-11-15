configure_lit_site_cfg(
  ${CMAKE_CURRENT_SOURCE_DIR}/lit.site.cfg.py.in
  ${CMAKE_CURRENT_BINARY_DIR}/lit.site.cfg.py
  MAIN_CONFIG
  ${CMAKE_CURRENT_SOURCE_DIR}/lit.cfg.py
)

set(PCCC_TEST_DEPS pccc-opt)

add_lit_testsuite(check-pccc "Running the PCCC regression tests"
  ${CMAKE_CURRENT_BINARY_DIR}
  DEPENDS ${PCCC_TEST_DEPS}
)

add_lit_testsuites(PCCC ${CMAKE_CURRENT_SOURCE_DIR}
  DEPENDS ${PCCC_TEST_DEPS}
)
