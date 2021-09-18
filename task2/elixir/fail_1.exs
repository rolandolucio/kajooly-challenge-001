defmodule Solution do
  @moduledoc """
  Implementation Details

  Aproach: Cahmpion vs Challenger
  while 3 valid keep moving


  LOCAL OK

  LEETCODE EXAMPLE TEST CASESES:  OK ~363ms

  LEETCODE SUBMIT: Fail
  44 / 131 test cases passed.
  Status: Wrong Answer
  Submitted: 0 minutes ago
  Input:
  [0,2,1,-3]
  1
  Output:
  3
  Expected:
  0

  """

  def closest([ _a ,_b | []], _target, champ), do: champ
  def closest([ a ,b , c | _tail], target,_champ) when (a+b+c) == target, do: target
  def closest([ a ,b , c | tail], target, champ) do
    chall = a+b+c
    if (chall >= champ and chall <= target) or (chall <= champ and chall >= target) do
        closest([ b, c |tail],target,chall)

    else
         closest([ b, c |tail],target,champ)
    end
  end
  @spec three_sum_closest(nums :: [integer], target :: integer) :: integer
  def three_sum_closest([ a ,b , c | tail], target) do
    closest([ a ,b , c | tail],target,a+b+c)
  end


  def main() do
    # Input: nums = [-1,2,1,-4], target = 1
    # Output: 2
    # Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
    # Example 2:

    # Input: nums = [0,0,0], target = 1
    # Output: 0

    three_sum_closest([-1,2,1,-4],1)
  end
end
IO.inspect(Solution.main)
