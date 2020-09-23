public interface ImmutableList {
    public boolean equals(final Object other);

    // public int length();
    // public int sum(); // empty list sum is defined as 0
    // public ImmutableList append(final ImmutableList other);
    // public boolean contains(final int value);

    public boolean isEmpty();

    // [].addAmount(3) -> []
    // [1, 2, 3].addAmount(5) -> [6, 7, 8]
    public ImmutableList addAmount(final int amount);

    public String toString();
    public int hashCode();
} // ImmutableList
