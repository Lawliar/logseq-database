#374. Guess Number Higher or Lower
1. correct way to do binary search (regardless of the loss of precision when dividing an odd number by 2): properly set the lower and upper bound of the binary search
2. non-UB way to take average of addition : `lower + (higher - lower) / 2` instead of `(lower + higher) / 2 `
#17. Two Sum
1. "unsorted_map.find" on average is O(1) whereas "map.find" is "log(n)".  
2. "Find" is to find the key not the value BTW.
#18. Add Two Numbers:
1. Remember the carry when both of the operands run out.
# 3. Longest Substring Without Repeating Characters
1. just adjust the start and end correctly
2. when adjust the start of the substring, you don't have to pop/push the cached last_post info, just start = max(start, pos[<cur char>]) is enough
