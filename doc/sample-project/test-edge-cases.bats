#!/usr/bin/env bats

@test "negative-number" {
  run ./duplicator -2
  [ "$status" -eq 0 ]
  [ "$output" -eq "-4" ]
}

@test "large-negative-number" {
  run ./duplicator -2147483648
  [ "$status" -eq 0 ]
  [ "$output" -gt "-2147483648" ]
}

@test "skip-it" {
  skip
}
