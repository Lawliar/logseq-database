# General knowledge
## 1. Tail Recursive 
- As opposed to head recursive, tail recursive does all processing and calls to the recursive function at the very end of the function. This makes keeping the stack unnecessary and optimizable.
- To turn a normal or head recursion to tail recursion, usually you add another paramter to the recursion function to upkeep the intermediate result. 

##374. Guess Number Higher or Lower
1. correct way to do binary search (regardless of the loss of precision when dividing an odd number by 2): properly set the lower and upper bound of the binary search
2. non-UB way to take average of addition : `lower + (higher - lower) / 2` instead of `(lower + higher) / 2 `

##17. Two Sum
1. "unsorted_map.find" on average is O(1) whereas "map.find" is "log(n)".  
2. "Find" is to find the key not the value BTW.

##18. Add Two Numbers:
1. Remember the carry when both of the operands run out.

## 3. Longest Substring Without Repeating Characters
1. just adjust the start and end correctly
2. when adjust the start of the substring, you don't have to pop/push the cached last_post info, just start = max(start, pos[<cur char>]) is enough

## 88. Merge Sorted Array 
start from the higher end, is clearer than starting from the lower end?
This feels similar to #27. 
It's just different angle of doing the same thing, 
but one has a much cleaner solution (and most likely much better performance). 
by cleaner solution, I mean, the steps are much fewer, no intermediate temperary variables as well. 

## 345. Reverse Vowels of a String
if you use python, remember string is not mutable, thus, you cannot assign the char of a string to another char, you can only concatenate. 
Thus, you need a list of chars and use ''.join(<list of chars>)

## 27. Remove elements
Description: from a list of integers, remove all elements equal to `val`, and remove them in-place.
- 1. l[:] = [list comphrehension], this operation is not destroying l, whereas l = [list comphehension based on l] is destroying l and assigning it to a new list. 
However, if I do:
for i in l[:]:
    if i == something:
        l.remove(i)
then, I am not modifying l, because, I guess l[:] creates a shallow copy, so it is l[:] was affected.
but, when i assign a new list to l[:], I was keeping l, why is this?


https://chat.openai.com/share/7b6bc449-b717-4ba2-bc49-0576f2065292
- 2. So, my solution is , find the first element that is `val`, and find the last element that is not `val` then, exchange them. 
why this is slower than, this :
	index = 0
        for i in range(len(nums)):
            if nums[i] != val:
                nums[index] = nums[i]
                index += 1
        return index
note that, I picked it up from where I left.

this "better" solution writes all non-val value, while I write all val value, 
I think mine has fewer writes?

# 169. Majority Element:
Description: a value that is in majority is guaranteed (appears more than n/2 times), how to find it?
- Sorting: this value will appear in the middle
- Hashmap: to record the number of appearance
Both of these two above has non-trivial memory consuption
- Boyer-Moore Majority Voting Algorithm: count set to 0, current value is the first element 
    - If the majority element has more than n/2 occurrences:

	The algorithm will ensure that the count remains positive for the majority element throughout the traversal, guaranteeing that it will be selected as the final candidate.
    - If the majority element has exactly n/2 occurrences:

	In this case, there will be an equal number of occurrences for the majority element and the remaining elements combined.However, the majority element will still be selected as the final candidate because it will always have a lead over any other element.

## 189. Rotate array:
the solution that I came up: 
`
offset = k % len(nums)
nums[:] = nums[-offset:] + nums[:nums_len - offset]
`
this is actually when I think the hints and other solutions are stupid. 

## 121. Best Time to buy and Sell Stock.
## 122. Best time to buy and sell stock 2
## 55. Jump Game

these three problems feel all the same to me:
I tried to use an approach more "globally", but, it turn out a more local greedy (more importantly more clean) approach is there and out performing my solution a lot in terms of speed and memory.

The reason why I cannot come up with such a simple greedy solution is mainly because of my lack of formating and understanding this problem.

To be more specific: for buy and sell stocks 1,
My first instinct is to find all "lower points" or buy points and calculate their corresponding sell points. This turns out to involve multiple iteration. 
This key is that, a global low-points can be maintain and adjusted in one iteration. 
It is clear that, the min(prices) is not necessarily the solution for the buy-in point, 
however, you maintain this min_price as you go. 

the same applies to Jump game, 
my first instinct is to iterate backwards (from the end point to the starting point)
however, the distance that you can jump can be any value within  that range not the value. 
this, makes greedy feasible.
Then, you can just maintain the "farest you can reach " and see if that exceeds the last element

## 45. Jump Game II
the key is still in local optimization leading to global optimization.
By stepping locally the maximum distance, you are also having the global fewest steps. 
However, pay attention to the details:
1. Which procedures constitute a iteration?
2. when did the iteration ends?

For the 1st one, for example, by deciding which new position(e.g., the 2nd) to take, you essentially also decides the next position too (e.g., the 3rd)
e.g., in [2,3,1,1,4], for the 1st decision, you choose between index-1 and index 2(3 and 1), 
when choosing 3, you also decides you are gonna land on the index 4. 
but you can only add 1 to your distance, not 1 + 3 (which is 4)

All these seems intuitive, but there can  easily be off-one error.


## 380. Insert Delete GetRandom O(1): revisit why

## 238. Product of Array Except Self:
product of suffix and prefix! Where does the efficiency comes from
I always depict a triangle-like structure, where the neighboring integers multiply each other, this is not helping at all. Even if we can cache all the intermediate result, it's not better than the suffix/prefix solution, and you even spent more memory and calculation.    

## 134. Gas Station
- starting from index a  to index b, if at getting b, the total gas, is below 0, then the solution cannot be anyhwere in between a and b (the same goes to starting from arbitrary location). Why?
- Frist we know, b is not reachable from a, the solution is starting from there, you can reach anywhere, so, a is not an option.
- Second, b must have a negative impact, so, not b. 
- Third, anywhere between a and b, is carried with the gas being equal or greater than zero, but it stopped at b, and starting from there, you have a empty gas tank, so anywhere in between is also not an option.

- Lastly, remember, the solution is unique, this guarantees that, say, if [a, b] did not work, and b + 1 worked, (i.e., from b+1 to the end of the array sum is not negative), then b+1 is the solution. 


## 135. Candies

## 42. Trapping, kinda like multiplication except self

## 58. Length of Last Word: 
str.split()
from docs.python:
str.split(sep=None)
If sep is not specified or is None, a different splitting algorithm is applied: runs of consecutive whitespace are regarded as a single separator, and the result will contain no empty strings at the start or end if the string has leading or trailing whitespace. Consequently, splitting an empty string or a string consisting of just whitespace with a None separator returns [].

## 6. Zigzag Conversion:
- string slicing operation[a:b:c] what does a,b,c each mean
- the faster better solution is always the one that is greedy, try to be greedy when you can.  
- this is just putting char into each row, in order, and then, just concatenate each row
My mistake is, I always try to look for a global solution, while you can just proceed char by char, and be done. 

## 167. Two Sum- Input Array Sorted
two pointers, one at the front, one back at the back and move closer to the middle.
This makes sense, as two pointers have a combined movement of n.
I remember I previously had the same idea for the similar problem ( 27. Remove Elements ), but this turns out slow,(why it worked for this one, but did not work for 27. )  27, in a sense is also two-pointer based solution, but that is two pointers starting from the same position, moving in one direction in different speeds, but, in here, it is two pointers starting from the opposite ends and move in different directions. 


## pitfall to initialize a 2D array:
instead of "[[0]*m] * n", you should do [[0]*m for i in range(n)]


## merge intervals:
sort the intervals gives you the nice porperty of "if 1 and 2 are not mergable, then 1 and 3 are not mergeble as well"
however, you do not have to modify and merge the interval in place(involing the list.pop), you can just create a new merge list, and keep updating the last element.

### recursive dfs:
dfs uses queue, bfs uses stack. (That is why you can code easily a bfs with recursion), but to use recursion to implement dfs, is stupid and inefficient, as it uses queue. 
https://stackoverflow.com/questions/2549541/performing-breadth-first-search-recursively

### in-order,pre-order,post-order, are different flavors of DFS.
https://stackoverflow.com/a/4526966/7244310






## important primitive data structures
1. list: array
2. doubled-linked list: collections.deque
3. set and dict: hash maps

## more advanced data structures:
1. ordered_dict: `doubled-linked list` with `dict`


## format integer to a string
format(<the integer>, "<padding char><how many padding chars><format>")
http://docs.python.org/2/library/string.html#format-specification-mini-language

## bitwise-and-of numbers-range
More specifically, the common prefix of all these bit strings is also the common prefix between the starting and ending numbers of the specified range (i.e. 9 and 12 respectively in the above example).

## about the boundary conditions of binary search:
since `p = l + (r-l) // 2`
if `l` and `r` are neighboring elements, p will always point to `l`. Thinking about this will help figure out the bounary condition, if you do not want a dead loop.
if the boundary condition is `l <= r`, then, `l` and `r` both have to move
if the bounadry condition is `l < r`, then, `l` always have to move, while `r` does not have to. 

## IPO:
I kept thinking about, how to retrive the projects within the given capital efficiently.
So, basically, I have an interval, I iterate through the projects checking if each project's capital falls into the interval.
At the end of each interval, I increase the interval to something not overlapping with the current interval.

I initially, iterate through all the projects everytime and check if its capital falls into the interval.
When the interval gets updated, I iterate through again.

However, I could have just sorted it!

### recursion with cache <=> top-down DP
recursion is also stack, which is also used for implementating BFS, right?
one problem with recursion is that, it might process a problem which was solved before.

### inverse a binary tree:
- pre-order:
`
def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
    if root == None:
         return None
    root.right, root.left = root.left, root.right
    self.invertTree(root.right)
    self.invertTree(root.left)
return root
`
- in-order
`
 def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
    if root == None:
        return None
    self.invertTree(root.left)
    root.right, root.left = root.left, root.right
    self.invertTree(root.left)
    return root
`
- post-order
`
def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
    if root == None:
        return None
    self.invertTree(root.left)
    self.invertTree(root.right)
    root.right, root.left = root.left, root.right
    return root
`

## circular sub array: consider prefix sum and suffix sum.

### different advanced data structures
- trie
- complete binary tree => (min/max) heap/priority heap
- LRU cache (doublly linked list  + hashmap) 

## list is not hashable, while a class is. 

## a = [[1,2]], then `for i, (x,y) in enumerate(a):` is legal
## DP for longest substring and longest subsequence:
1. DP for longest substring:
```
       for i in range(n+1):
            for j in range(n+1):
                if(i == 0):
                    dp[0][j] = ""
                elif(j == 0):
                    dp[i][0] = ""
                elif s1[i-1]==s2[j-1]:
                    dp[i][j] = dp[i-1][j-1] + s1[i-1]
                else:
                    dp[i][j] = ""
                if len(dp[i][j]) > len(ret):
                    ret = dp[i][j]
```
2. DP for longest subsequence:

```
        for i in range(n+1):
            for j in range(n+1):
                if(i == 0):
                    dp[0][j] = ""
                elif(j == 0):
                    dp[i][0] = ""
                elif s1[i]==s2[j]:
                    dp[i][j] = dp[i-1][j-1] + s1[i]
                else:
                    op1 = dp[i-1][j]
                    op2 = dp[i][j-1]
                    dp[i][j] = op1 if len(op1) > len(op2) else op2 
```
