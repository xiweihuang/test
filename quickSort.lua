-- 快速排序

local function quickSort(tab, left, right)
	if not left then left = 1 end
	if not right then right = #tab end

	if left > right then -- 递归终止条件
		return nil
	end

	local temp = tab[left]   -- 基准值
	local i, j = left, right

	while (i ~= j) do
		while (tab[j] >= temp and i < j) do
			j = j - 1
		end
		while (tab[i] <= temp and i < j) do
			i = i + 1
		end

		tab[i], tab[j] = tab[j], tab[i] -- 这里还要优化一下，做一下判断
	end

	tab[left] = tab[i]
	tab[i] = temp

	quickSort(tab, left, i-1)
	quickSort(tab, i+1, right)

end

local testArr = {21, 12, 156, 321, 11, 8, 0, 12}

quickSort(testArr)

for i=1,#testArr do
	print(testArr[i])
end