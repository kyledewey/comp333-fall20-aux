public interface ImmutableList {
    public boolean equals(final Object other);
    // public int length();
    // public int sum(); // empty list sum is defined as 0
    // public ImmutableList append(final ImmutableList other);
    // public boolean contains(final int value);

    public boolean isEmpty();

    // public boolean isEmpty() {
    //   if (head of the list is Nil) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // }

    // [1, 2, 3].addAmount(5) -> [6, 7, 8]
    // [7].addAmount(2) -> [9]
    // [8, 2].addAmount(1) -> [9, 3]
    // [].addAmount(5) -> []
    public ImmutableList addAmount(final int amount);
    
    public String toString();
    public int hashCode();
} // ImmutableList
