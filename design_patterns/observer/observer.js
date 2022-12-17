
class Observable {

    constructor() {
        this.observers = [];
    }

    addObserver(observer) {
        this.observers.push(observer)
    }


    trigger(a) {
        for (const observer of this.observers) {
            observer.trigger(a);
        }
    }
}

const observable = new Observable();

observable.addObserver({
    trigger: (a) => console.log("First observer triggered with: " + a)
});

observable.addObserver({
    trigger: function (a) {
        console.log("Second observer triggered with: " + a);
    }
})

observable.trigger(10);

