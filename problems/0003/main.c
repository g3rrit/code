int lengthOfLongestSubstring(char * s){
    int m = 0;
    int res = 0;
    
    size_t len = strlen(s);
    char* n = s;
    
    for (int i = 0; i < len; i++) {
        if (memchr(n, s[i], i - (n - s))) {
            n++;
            i = (n - s);
            m = 0;
        }

        m++;
       
        if (m >= res) {
            res = m;
        }
        

    }
    
    return res;
}