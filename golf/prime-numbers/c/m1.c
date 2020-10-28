main(n,i){
    for(;i<n;++i)
        (n%i)||(i=n);
    i^n||printf("%d\n",n);
    n++-99&&main(n,2);
}
