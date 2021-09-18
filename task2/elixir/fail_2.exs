defmodule Solution do
  @moduledoc """
  Implementation Details

  Aproach: Cahmpion vs Challenger
  fixing from fail_1


  LOCAL fail

  LEETCODE EXAMPLE TEST CASESES:  OK ~363ms

  LEETCODE SUBMIT: Fail
  46 / 131 test cases passed.
  Status: Wrong Answer
  Submitted: 12 minutes ago
  Input:
  [1,1,-1,-1,3]
  3
  Output:
  1
  Expected:
  3

  """

  def closest([ _a ,_b | []], _target, champ), do: champ
  def closest([ a ,b , c | _tail], target,_champ) when (a+b+c) == target, do: target
  def closest([ a ,b , c | tail], target, champ) do
    # [1,1,-1,-1,3], 3 , 1
    # [1,-1,-1,3], 3 , 1
    chall = a+b+c
    #1
    chall_delta = abs(target - chall)
    #2
    champ_delta = abs(target - champ)
    #2
    cond do
      chall_delta <= champ_delta -> closest([b , c | tail],target,chall)
      true -> closest([b , c | tail],target,champ)
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

    #test case 44
    # Input:
    # [0,2,1,-3]
    # 1
    # 0
    #three_sum_closest([0,2,1,-3],1)

    # Input
    # [1,1,-1,-1,3]
    # 3
    # Output
    # 1
    # Expected
    # 3
    three_sum_closest([1,1,-1,-1,3],3)
  end
end
IO.inspect(Solution.main)
