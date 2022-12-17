
class Builder {

    private int a = 0;
    private int b = 0;

    public Builder addA(int a) {
        this.a = a;
        return this;
    }

    public Builder addB(int b) {
        this.b = b;
        return this;
    }

    @Override
    public String toString() {
        return "Builder { a: " + this.a + ", b: " + this.b + " }";
    }

    public static void main(String[] args) {

        Builder builder = new Builder().addA(10).addB(20);

        System.out.println(builder);
    }
}
