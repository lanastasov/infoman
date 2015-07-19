package winter

func E1_2014(num int, path []int) (int, int) {

	sum := 0
	cnt := 1
	max := 0
	last := 0
	for i := 0; i < num-2; i++ {

		if len(path) == 2 {
			if path[0] >= path[1] {
				return 1, max_divisor(path[0])
			} else {
				return 2, max_divisor(path[0] + path[1])
			}
		}

		if path[i] < path[i+1] {
			cnt += 1
			if max < cnt {
				max = cnt
				last = i + 1
			}
		} else {
			cnt = 1
		}

	}
	for i := last - max + 1; i <= last; i++ {
		sum += path[i]
	}
	return max, max_divisor(sum)
}

func max_divisor(num int) int {
	for i := 2; i <= num/2; i++ {
		if num%i == 0 {
			return num / i
		}
	}
	return -1
}
