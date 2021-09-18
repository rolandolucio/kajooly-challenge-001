defmodule Solution do
  @moduledoc """
  Implementation Details

  Example Tests OK

  FAILED AT LEETCODE
  32 / 60 test cases passed.
  Status: Runtime Error
  Submitted: 0 minutes ago
  Runtime Error Message:
  eheap_alloc: Cannot allocate 255489152 bytes of memory (of type "heap").
  Crash dump is being written to: erl_crash.dump...
  Last executed input:
  [76,155,15,188,180,154,84,34,187,142,22,5,27,183,111,128,50,58,2,112,179,2,100,111,115,76,134,120,118,103,31,146,58


  Brute Force
  Works on:
  small lists

  Fails on:
  Runtime Error Message:
  eheap_alloc: Cannot allocate 255489152 bytes of memory (of type "heap").
  Crash dump is being written to: erl_crash.dump...

  Recursive move to obtain each step area to form a new list
  [ 1, 8 | tail], 1,0
  [ 1 | tail], 2, 1     [ 8 | tail], 1, 1 ...
  [ 1 | tail], 3, 1     [ 6 | tail], 1, 1 ...
  [ 8 | tail], 2, 6     [ 6 | tail], 1, 6 ...

  [1, 3, 1, 4, 1, 6, 1, 4, 1, 3, 1, 10, 1, 9, 1, 2, 1, 3, 1, 4, 1, 6, 1, 4, 1, 3,
  1, 6, 1, 8, 1, 2, 1, 3, 1, 4, 1, 6, 1, 4, 1, 3, 1, 10, 1, 9, 1, 10, 1, 3, ...]

  from the new list find the max
  """
  def area( a, b, h ) do
    if a <= b, do: a*h, else: b*h
  end

  def move([_a | []],_h), do: [0]
  def move([ a, b | []], h), do: [area( a,b,h )]
  def move([a, b | tail], h) do
    move([b | tail],1) ++ [area( a,b,h )] ++ move([a | tail],h+1)
  end

  def max_area(height) do
    Enum.max(move height, 1)
  end

  def main() do
    # Sumbmision res 18048
    submit = [76,155,15,188,180,154,84,34,187,142,22,5,27,183,111,128,50,58,2,112,179,2,100,111,115,76,134,120,118,103,31,146,58,198,134,38,104,170,25,92,112,199,49,140,135,160,20,185,171,23,98,150,177,198,61,92,26,147,164,144,51,196,42,109,194,177,100,99,99,125,143,12,76,192,152,11,152,124,197,123,147,95,73,124,45,86,168,24,34,133,120,85,81,163,146,75,92,198,126,191]
    # examples 1
    # submit = [1,8,6,2,5,4,8,3,7]
    max_area(submit)

  end

end

 IO.inspect(Solution.main)
