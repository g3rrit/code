main(i,n){
puts("2");
for(n=0;
    n<99;
    n%i||(i=n),
        ++i<n||(i^n||printf("%d\n",n),i=2,n++));
}
