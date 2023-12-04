#!/usr/bin/env bats

@test "bbb" {
  result="$(echo 2+2 | bc)"
  [ "$result" -eq 4 ]
}

@test "ccc" {
  result="$(echo 2 2+p | dc)"
  [ "$result" -eq 4 ]
}
