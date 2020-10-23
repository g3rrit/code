int expand_odd(char* s, char** res, int len) {
    int l = 1;
    *res = s;
    for (int i = 1;i <= len; i++) {
        if (*(s - i) != *(s + i)) {
            break;
        }
        *res = s - i;
        l = 1 + 2 * i;
        
    }
    
    return l;
}

int expand_even(char* s, char** res, int len) {
    int l = 0;
    *res = s;
    
    for (int i = 1; i <= len; i++) {
        if(*(s - (i - 1)) != *(s + i)) {
            break;
        }
        *res = s - (i - 1);
        l = 2 * i;
    }
    
    return l;
}

#define min(a, b) (a) < (b) ? (a) : (b)

char * longestPalindrome(char * s){

    int len = strlen(s);
    int max = 1;
    char* res = s;
    char *r = s;
    
    int t = 0;
    for (int i = 0; i < len; i++) {
        if ((t = expand_odd(s + i, &r, min(len - i - 1, i))) > max) {
            max = t;    
            res = r;
        }
        if ((t = expand_even(s + i, &r, min(len - i - 1, i + 1))) > max) {
            max = t;    
            res = r;
        }
    }
       
    if (max < len) {
        res[max] = 0;
    }
    return res;
}