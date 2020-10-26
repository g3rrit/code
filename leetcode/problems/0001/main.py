class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        m = {}
        for i, v in enumerate(nums):
            com = target - v
            if com in m:
                return [i, m[com]]
            m[v] = i