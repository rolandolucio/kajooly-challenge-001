defmodule Solution do
  @moduledoc """
  Implementation Details

  Aproach: Cahmpion vs Challenger
  fixing from fail_2
  OOOPS!!! Miss read the problem
  it say any 3 not in order no window as did
  Refactor
  guards
      if a+b+c == target, stop we are done



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

  '''
  ideas
  def closest( target, chall, {_champ, _champd}) when chall == target, do: { :ok , target }
  def closest( target, chall, {_champ, champd}) when abs(target - chall) <= champd, do: { :nop, chall }
  def closest( _target, _chall, {champ, _champd}), do: { :nop, champ }
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
  def cycle( [ a, b, c ], target,  { champ, champd}), do: closest( target, (a+b+c), { champ, champd})
  def cycle( [ a, b | tail], target) do

  end
  '''


  @spec three_sum_closest(nums :: [integer], target :: integer) :: integer
  def three_sum_closest( list ,_target) when length(list) <=3 ,do: Enum.sum(list)
  def three_sum_closest( list, target) do
    # Enum.uniq(list)
    base = list
      |> Enum.sort
      |> Enum.with_index
    # |> List.to_tuple  # if timeout next try to tupple
    reverse = Enum.reverse(base)
    init(base, reverse, target)
  end


  def init([ { av, _ai}, { bv, _bi} | _tail], [ { zv, _zi} | _header],target) when ( av+bv+zv) == target, do: target
  def init([ { av, ai}, { bv, bi} | tail], [ { zv, zi} | header],target) do
    champ = av+bv+zv
    champd = abs(target - champ)
    cycle({champ, champd },[ { av, ai}, { bv, bi} | tail], [ { zv, zi} | header],target)
  end

  # def cycle({:ok, res, _},_,_,_), do: res

  def cycle(_,[ { av, _ai}, { bv, _bi} | _tail], [ { zv, _zi} | _header],target) when ( av + bv + zv) === target, do: target
  def cycle({champ, champd },[ { av, ai}, { bv, bi} | tail], [ { zv, zi} | header],target) do
    chall = av+bv+zv
    challd = abs(target - chall)
    cchamp = if challd <= champd, do: {chall, challd} ,else: {champ, champd }

    cond do
      chall < target -> cycle(cchamp,[ { av, ai} | tail], [ { zv, zi} | header],target)
      chall > target -> cycle(cchamp,[ { av, ai}, { bv, bi} | tail], [ { zv, zi} | header],target)
    end
  end
  def cycle({champ, champd },ini, _fin,_target) when length(ini) < 3, do: champ


  def main() do
    # Input: nums = [-1,2,1,-4], target = 1
    # Output: 2
    # Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
    # Example 2:
    IO.puts("#{1},#{2}")
    three_sum_closest([-1,2,1,-4],1)
    |> IO.inspect
    # Input: nums = [0,0,0], target = 1
    # Output: 0
    IO.puts("#{1},#{0}")
    three_sum_closest([0,0,0],1)
    |> IO.inspect
    #test case 44/131
    # Input:
    # [0,2,1,-3]
    # 1
    # 0
    #three_sum_closest([0,2,1,-3],1)
    IO.puts("#{1},#{0}")
    three_sum_closest([0,2,1,-3],1)
    |> IO.inspect
    # test case 46/131
    # Input
    # [1,1,-1,-1,3]
    # 3
    # Expected
    # 3
    IO.puts("#{3},#{3}")
    three_sum_closest([1,1,-1,-1,3],3)
    |> IO.inspect
  end
end
Solution.main
