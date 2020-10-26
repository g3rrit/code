/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target, int* returnSize)
{
    
    *returnSize = 2;
    int* rnums = malloc(sizeof(int) * 2);
    
    int i = 0;
    int n = 0;
    for (; i < numsSize; i++) {
        for (n = i + 1; n < numsSize; n++) {
            if (nums[i] + nums[n] == target) {
                rnums[0] = i;
                rnums[1] = n;
                goto done;
            }
        }        
    }
done:
    return rnums;
}