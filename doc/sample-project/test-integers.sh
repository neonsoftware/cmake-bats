#!/usr/bin/env bats

@test "duplicate5" {
  # TODO (in Windows, this is Debug/duplicator.exe)
  run ./duplicator 5
  [ "$status" -eq 0 ]
  [ "$output" -eq "10" ]
}

@test "duplicate0" {
  run ./duplicator 0
  [ "$status" -eq 0 ]
  [ "$output" -eq "0" ]
}