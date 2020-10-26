double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size){
    
    int len = nums1Size + nums2Size;
    int merged[len];
    int i = 0;
    int n = 0;
    for (; i < nums1Size || n < nums2Size;) {
        
        if (i >= nums1Size) {
            memcpy(merged + i + n, nums2 + n, sizeof(int) * (nums2Size - n));
            break;
        }
        if (n >= nums2Size) {
            memcpy(merged + i + n, nums1 + i, sizeof(int) * (nums1Size - i));
            break;
        }
        
        if (nums1[i] <= nums2[n]) {
            merged[i + n] = nums1[i];
            i++;
        } else {
            merged[i + n] = nums2[n];
            n++;
        }
    }
    
    if (len & 1) {
        return merged[len / 2];
    } else {
        return (double) (merged[len / 2 - 1] + merged[len / 2]) / 2;
    }
}