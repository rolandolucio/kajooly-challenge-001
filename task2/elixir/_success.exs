defmodule Solution do
  @moduledoc """
  Implementation Details

  Aproach: Cahmpion vs Challenger
  fixing from fail_3
  failed to do it different goin back to the loop loop base



  LOCAL ok ~100ms

  LEETCODE EXAMPLE TEST CASESES:  OK ~363ms

  LEETCODE SUBMIT:
  Success
  Details
  Runtime: 446 ms, faster than 100.00% of Elixir online submissions for 3Sum Closest.
  Memory Usage: 49.6 MB, less than 100.00% of Elixir online submissions for 3Sum Closest.

  131 / 131 test cases passed.
  Status: Accepted
  Runtime: 446 ms
  Memory Usage: 49.6 MB

  """

  @spec three_sum_closest(nums :: [integer], target :: integer) :: integer
  def three_sum_closest( list ,_target) when length(list) <=3 ,do: Enum.sum(list)
  def three_sum_closest( list, target) do
    # Enum.uniq(list)
    base = list
      |> Enum.sort
      |> Enum.with_index
    # |> List.to_tuple  # if timeout next try to tupple
    reverse = Enum.reverse(base)
    # init(base, reverse, target)
    # |> Enum.max
    {_, {sum, _}} = loop(base,reverse,target)
    sum
  end

  def loop( [a | tail], reverse, target) do
    case xyz([a | tail], reverse, target, {999999,999999}) do
      { :done, champ} -> {:ok, champ}
      { :eoc, champ} -> loop( tail, reverse, target,champ)
    end
  end
  def loop( [a | tail], reverse, target,champ) do
    case xyz([a | tail], reverse, target, champ) do
      { :done, champ} -> {:eol, champ}
      { :eoc, champ} -> loop( tail, reverse, target,champ)
        # case loop( tail, reverse, target,champ) do
        #   { :eol , champ} -> {:eol, champ}
        #   { :eoc, champ} -> loop( tail, reverse, target,champ)
        # end
    end
  end
  def loop( base, _, _, champ ) when length(base) <=2, do: { :eol, champ}



  def xyz([{ av, ai}, { bv, bi} | tail], [{ zv, zi} | lefty], target, ochamp) when ( bi < zi) do
    challv = av+bv+zv
    challd = abs(target - challv)

    case way(target, {challv, challd}, ochamp) do
      {:ok,champ} -> { :done , champ}
      {:left,champ} -> xyz([{ av, ai} | tail], [{ zv, zi} | lefty], target, champ)
      {:right,champ} -> xyz([{ av, ai}, { bv, bi} | tail], lefty, target, champ)
    end
  end
  def xyz(_,_,_, champ), do: { :eoc, champ}

  def way( target, {challv, _challd}, {_champv, _champd}) when challv == target, do: { :ok , {target,0} }
  def way( target, {challv, challd}, {champv, champd}) when challv < target, do: { :left, battle({challv, challd}, {champv, champd})}
  def way( _target, {challv, challd}, {champv, champd}), do: { :right, battle({challv, challd}, {champv, champd})}

  def battle({challv, challd}, {_champv, champd}) when challd <= champd, do: {challv, challd}
  def battle(_chall, {champv, champd}), do: {champv, champd}




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
