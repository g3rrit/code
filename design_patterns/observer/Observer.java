import java.util.ArrayList;

public class Observer {

    interface Channel<A> {
        public void trigger(A a);
    }

    static class ChannelA implements Channel<Integer> {
        @Override
        public void trigger(Integer a) {
            System.out.println("Channel A trigger with: " + a);
        }
    }

    static class ChannelB implements Channel<Integer> {
        @Override
        public void trigger(Integer a) {
            System.out.println("Channel B trigger with: " + a);
        }
    }

    static class Observerable<A> {

        private ArrayList<Channel<A>> observers = new ArrayList<Channel<A>>();

        public void addChannel(Channel<A> c) {
            observers.add(c);
        }

        public void trigger(A a) {
            for (Channel<A> c : observers) {
                c.trigger(a);
            }
        }
    }

    public static void main(String[] args) {

        ChannelA cA = new ChannelA();
        ChannelB cB = new ChannelB();

        Observerable<Integer> observable = new Observerable<Integer>();
        observable.addChannel(cA);
        observable.addChannel(cB);

        observable.trigger(10);
    }
}

