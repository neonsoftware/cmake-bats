#!/usr/bin/env bats

@test "duplicate5" {
  run ./duplicator 5
  [ "$status" -eq 0 ]
  [ "$output" -eq "10" ]
}

@test "duplicate0" {
  run ./duplicator 0
  [ "$status" -eq 0 ]
  [ "$output" -eq "0" ]
}