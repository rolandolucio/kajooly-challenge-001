defmodule Solution do
  @moduledoc """
  Implementation Details

  Aproach: Elixir can validate equals no need to iterate


  LOCAL OK ~ 1s

  LEETCODE EXAMPLE TEST CASESES:  OK ~293ms

  LEETCODE SUBMIT: Success
  Runtime: 292 ms, faster than 43.75% of Elixir online submissions for Same Tree.
  Memory Usage: 51 MB, less than 37.50% of Elixir online submissions for Same Tree.

  """
  @spec is_same_tree(p :: TreeNode.t | nil, q :: TreeNode.t | nil) :: boolean
  def is_same_tree(p, q) when p == q, do: true
  def is_same_tree(_p, _q), do: false

  def main() do
    # #ok test
    # p = [1,2,3]
    # q = [1,2,3]

    # fail test
    p = [1,2]
    q = [1,nil,2]

    is_same_tree(p,q)
  end
end
IO.inspect(Solution.main)
