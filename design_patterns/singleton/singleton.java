
public class Singleton {

    private static Singleton instance = null;

    public int value = 0;

    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }

        return instance;
    }
    
    private Singleton() {}

    public static void main(String[] args) {

        Singleton s1 = Singleton.getInstance();
        Singleton s2 = Singleton.getInstance();

        System.out.println("s1 value: " + s1.value);
        
        s1.value = 4;

        System.out.println("s2 value: " + s2.value);
    }
}

