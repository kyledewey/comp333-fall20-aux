public class Cons implements ImmutableList {
    // ---BEGIN INSTANCE VARIABLES---
    public final int head;
    public final ImmutableList tail;
    // ---END INSTANCE VARIABLES---

    public Cons(final int head, final ImmutableList tail) {
        this.head = head;
        this.tail = tail;
    } // Cons

    public boolean equals(final Object other) {
        if (other instanceof Cons) {
            final Cons otherCons = (Cons)other;
            return head == otherCons.head && tail.equals(otherCons.tail);
        } else {
            return false;
        }
    } // equals

    // tail.tail
    // tail: ImmutableList
    // tail: ((Cons)tail).tail
    //
    // tail instanceof Cons && ((Cons)tail).tail
    // 
    // if (tail instanceof Cons) {
    //   ...
    // } ...
    //
    // public static void doSomething(ImmutableList element) {
    //   if (element instanceof Cons) {
    //     // Cons stuff here
    //   } else if (element instanceof Nil) {
    //     // Nil stuff here
    //   }
    // }
    //
    // Calling it (above): doSomething(list)
    //
    // public interface ImmutableList {
    //   public void doSomething();
    // }
    //
    // public class Cons implements ImmutableList {
    //   public void doSomething() {
    //     // Cons stuff here
    //   }
    // }
    //
    // public class Nil implements ImmutableList {
    //   public void doSomething() {
    //     // Nil stuff here
    //   }
    // }
    //
    // Calling it (above): list.doSomething()
    //
    
    public String toString() {
        return "Cons(" + head + ", " + tail.toString() + ")";
    } // toString

    public int hashCode() {
        return 0;
    } // hashCode

    public boolean isEmpty() {
        return false;
    }

    // obj.foo()
    //
    // public class Object {
    //   public void foo() {
    //     // this: obj
    //   }
    //
    // foo(obj)
    
    
    // [1, 2, 3].addAmount(5) -> [6, 7, 8]
    // this: Cons(1, Cons(2, Cons(3, Nil)))
    // head: 1
    // amount: 5
    // tail: Cons(2, Cons(3, Nil))
    // desired return value: Cons(6, Cons(7, Cons(8, Nil)))
    public ImmutableList addAmount(final int amount) {
        // this: Cons (which is an ImmutableList)
        // head: int
        // amount: int
        // tail: ImmutableList

        final ImmutableList recursiveCall = tail.addAmount(amount);
        // recursiveCall: Cons(7, new Cons(8, Nil))

        final int newHead = head + amount;
        // newHead: 6

        final ImmutableList result =
            new Cons(newHead, recursiveCall);
        // result: Cons(6, Cons(7, Cons(8, Nil)))
        
        return result;
    }

    // public ImmutableList addAmount(final int amount) {
    //     return new Cons(head + amount, tail.addAmount(amount));
    // }
} // Cons
