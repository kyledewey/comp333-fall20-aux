public class Cons implements ImmutableList {
    // ---BEGIN INSTANCE VARIABLES---
    public final int head;
    public final ImmutableList tail;
    // ---END INSTANCE VARIABLES---

    public Cons(final int head, final ImmutableList tail) {
        this.head = head;
        this.tail = tail;
    } // Cons

    // contains: return value == head || <<recursive call>>
    // if (value == head) {
    //   return true;
    // } else {
    //   return <<recursive call>>;
    // }
    public boolean equals(final Object other) {
        if (other instanceof Cons) {
            final Cons otherCons = (Cons)other;
            return head == otherCons.head && tail.equals(otherCons.tail);
        } else {
            return false;
        }
    } // equals
    
    public String toString() {
        return "Cons(" + head + ", " + tail.toString() + ")";
    } // toString

    public int hashCode() {
        return 0;
    } // hashCode

    public boolean isEmpty() {
        return false;
    }

    public ImmutableList addAmount(final int amount) {
        return new Cons(head + amount, tail.addAmount(amount));
    }
    
    // [1, 2, 3]
    // 1 -> 2 -> 3 -> Nil
    // restResult: 7 -> 8 -> Nil
    public ImmutableList addAmount(final int amount) {
        // variables in play:
        // -amount: the amount to add
        // -head: the value of the current list element
        // -tail: the rest of the list (either Nil, Cons)

        // recursion:
        //this.head.addAmount(

        final ImmutableList restResult = tail.addAmount(amount);
        final int newAmount = head + amount;
        return new Cons(newAmount, restResult);
    }
} // Cons
