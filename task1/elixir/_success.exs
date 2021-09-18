defmodule Solution do
  @moduledoc """
  Implementation Details

  Aproach: brute force

  LOCAL ok

  LEETCODE EXAMPLE TEST CASESES: ok

  LEETCODE SUBMIT:
  Success
  Details
  Runtime: 304 ms, faster than 100.00% of Elixir online submissions for Max Points on a Line.
  Memory Usage: 53.2 MB, less than 100.00% of Elixir online submissions for Max Points on a Line.

  34 / 34 test cases passed.
  Status: Accepted
  Runtime: 304 ms
  Memory Usage: 53.2 MB
  Submitted: 3 minutes ago

  """


  @spec max_points(points :: [[integer]]) :: integer
  def max_points(points) when length(points)<=2, do: length(points)
  def max_points(points) do

    matrix = points |> Enum.sort
    matrix
    n = length(matrix)

    xl = matrix |> Enum.map(fn [x,y] -> x end) |> Enum.uniq |> Enum.sort
    { xi, xk } =  xl |> Enum.min_max
    xn = xk - xi
    xc = { xi, xk, xn}

    yl = matrix |> Enum.map(fn [x,y] -> y end) |> Enum.uniq |> Enum.sort
    { yi, yk } =  yl |> Enum.min_max
    yn = yk - yi
    yc = { yi, yk, yn}

    c = { n , xc, yc}
    lh = scan_horizontal(matrix, yl,[])
    # lines_horizontal(matrix,3)
    lv = scan_vertical(matrix, xl,[])
    lvh= lv ++ lh
    # scan_diagonal_x(matrix, matrix,[])

    ldu = scan_diagonal_up(matrix,[])


    mirror =
    matrix
    |> Enum.map( fn [x,y] -> [ x-(x*2),y] end )
    |> Enum.sort
    |> scan_diagonal_up([])

    mirror ++ ldu ++ lvh
    |> count_it
    |> Enum.max

  end

  def count_it(bilist), do: Enum.map(bilist, fn c -> length(c) end)

  def scan_diagonal_up([], line), do: line
  def scan_diagonal_up([ head | matrix], line) do
    # IO.puts(" ======= \n")
    # IO.inspect({head})
    # IO.inspect(matrix)
    nline = inner_lines(head,matrix,[])
    # IO.inspect(nline)
    # IO.puts(" ======= \n")
    scan_diagonal_up(matrix, line ++ nline)
  end

  def cut_matrix([hx,hy],matrix) do
    matrix |> Enum.filter(fn [x,y] -> x > hx and y > hy end)
  end

  # inner_lines([1, 1],[[1, 4], [2, 3], [3, 2], [4, 1], [5, 3]])
  # [[[3, 2], [5, 3]], [[2, 3]]]
  def inner_lines( _point_a, [], _ ), do: []
  def inner_lines( point_a, matrix, line) do
    cmatrix = cut_matrix(point_a,matrix)
    case length(cmatrix) do
      0 -> line
      n ->
        # {{point_a},{cmatrix}, n}
        # {{[1, 1]}, {[[2, 3], [3, 2], [5, 3]]}, 3}
        cmatrix
        |> Enum.map(fn e ->  %{ l: e, a: angle(point_a,e) } end)
        |> Enum.group_by(&(&1.a))
        |> Enum.map(fn {_id, data} ->
            # IO.inspect(data)
            inner = data
            |> Enum.map( fn e ->
                  # IO.inspect(e)
                  e.l
              end
            )
            [point_a | inner]
          end
        )
    end
  end

  def angle([hx,hy], [nx,ny]) do
    c = nx - hx
    a = ny - hy
    :math.atan(a/c)
  end

  def aligned(point_a, point_b, point_c), do: angle(point_a, point_b) == angle(point_b, point_c)

  def scan_vertical(_, [],res), do: res
  def scan_vertical(matrix,[ head | tail], res) do
    lines = lines_vertical(matrix,head)
    nres =  if length(lines) < 2 , do: res , else: res ++ [lines]
    scan_vertical(matrix, tail, nres)
  end

  def lines_vertical(matrix,head) do
    lines = matrix |> Enum.filter(fn [x,y] -> x==head end)
    lines
  end

  def scan_horizontal(_, [],res), do: res
  def scan_horizontal(matrix,[ head | tail], res) do
    lines = lines_horizontal(matrix,head)
    nres =  if length(lines) < 2 , do: res , else: res ++ [lines]
    scan_horizontal(matrix, tail, nres)
  end

  def lines_horizontal(matrix,head) do
    lines = matrix |> Enum.filter(fn [x,y] -> y==head end)
    lines
  end




  def main() do
    # Input: nums = [-1,2,1,-4], target = 1
    # Output: 2
    # Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
    # Example 2:
    # IO.puts("
    # Input: points = [[1,1],[2,2],[3,3]]
    # Output: 3
    # ")
    # input = [[1,1],[2,2],[3,3]]
    # max_points(input)
    # |> IO.inspect
    IO.puts("
    Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
    Output: 4
    ordered: [[1, 1], [1, 4], [2, 3], [3, 2], [4, 1], [5, 3]]
    diag_up: {[1, 1], [[2, 3], [3, 2], [5, 3]], [2, 3], [[3, 2], [5, 3]]}
    ")
    input = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
    max_points(input)
    |> IO.inspect

  end
end
Solution.main
