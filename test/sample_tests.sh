#!/usr/bin/env bats

@test "aaa" {
  result="$(echo 2+2 | bc)"
  [ "$result" -eq 4 ]
}

@test "ddd" {
  result="$(echo 2 2+p | dc)"
  [ "$result" -eq 4 ]
}
