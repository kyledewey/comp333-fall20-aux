import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;
import org.junit.Test;

public class ImmutableListTest {
    // ---BEGIN EQUALS TESTS---
    @Test
    public void equalsNilNil() {
        assertTrue(new Nil().equals(new Nil()));
    } // equalsNilNil

    @Test
    public void equalsNilCons() {
        assertFalse(new Nil().equals(new Cons(1, new Nil())));
    } // equalsNilCons

    @Test
    public void equalsConsNil() {
        assertFalse(new Cons(1, new Nil()).equals(new Nil()));
    } // equalsConsNil

    @Test
    public void equalsConsConsSameElementsLength1() {
        assertTrue(new Cons(1, new Nil()).equals(new Cons(1, new Nil())));
    } // equalsConsConsSameElementsLength1

    @Test
    public void equalsConsConsDifferentElementsLength1() {
        assertFalse(new Cons(1, new Nil()).equals(new Cons(2, new Nil())));
    } // equalsConsConsDifferentElementsLength1

    @Test
    public void equalsConsConsSameElementsLength2() {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(1, new Cons(2, new Nil()));
        assertTrue(first.equals(second));
    } // equalsConsConsSameElementsLength2

    @Test
    public void equalsConsConsDifferentElementsLength2_1() {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(1, new Cons(3, new Nil()));
        assertFalse(first.equals(second));
    } // equalsConsConsDifferentElementsLength2_1

    @Test
    public void equalsConsConsDifferentElementsLength2_2() {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(2, new Cons(1, new Nil()));
        assertFalse(first.equals(second));
    } // equalsConsConsDifferentElementsLength2_2

    @Test
    public void equalsConsConsDifferentElementsLength2_3() {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(3, new Cons(4, new Nil()));
        assertFalse(first.equals(second));
    } // equalsConsConsDifferentElementsLength2_3
    // ---END EQUALS TESTS---

    // // ---BEGIN LENGTH TESTS---
    // @Test
    // public void lengthLength0() {
    //     assertEquals(0, new Nil().length());
    // } // lengthLength0

    // @Test
    // public void lengthLength1() {
    //     assertEquals(1, new Cons(-80, new Nil()).length());
    // } // lengthLength1

    // @Test
    // public void lengthLength2() {
    //     assertEquals(2, new Cons(-12, new Cons(5, new Nil())).length());
    // } // lengthLength2

    // @Test
    // public void lengthLength3() {
    //     final ImmutableList list = new Cons(-4, new Cons(87, new Cons(0, new Nil())));
    //     assertEquals(3, list.length());
    // } // lengthLength3
    // // ---END LENGTH TESTS---

    // // ---BEGIN SUM TESTS---
    // @Test
    // public void sumLength0() {
    //     assertEquals(0, new Nil().sum());
    // } // sumLength0

    // @Test
    // public void sumLength1() {
    //     assertEquals(5, new Cons(5, new Nil()).sum());
    // } // sumLength1

    // @Test
    // public void sumLength2() {
    //     assertEquals(3, new Cons(-1, new Cons(4, new Nil())).sum());
    // } // sumLength2

    // @Test
    // public void sumLength3() {
    //     assertEquals(12, new Cons(6, new Cons(0, new Cons(6, new Nil()))).sum());
    // } // sumLength3
    // // ---END SUM TESTS---

    // // ---BEGIN APPEND TESTS---
    // @Test
    // public void appendNilNil() {
    //     final ImmutableList first = new Nil();
    //     final ImmutableList second = new Nil();
    //     final ImmutableList expected = new Nil();
    //     assertEquals(expected, first.append(second));
    // } // appendNilNil

    // @Test
    // public void appendConsNil() {
    //     final ImmutableList first = new Cons(0, new Nil());
    //     final ImmutableList second = new Nil();
    //     final ImmutableList expected = new Cons(0, new Nil());
    //     assertEquals(expected, first.append(second));
    // } // appendConsNil

    // @Test
    // public void appendNilCons() {
    //     final ImmutableList first = new Nil();
    //     final ImmutableList second = new Cons(1, new Nil());
    //     final ImmutableList expected = new Cons(1, new Nil());
    //     assertEquals(expected, first.append(second));
    // } // appendNilCons

    // @Test
    // public void appendConsConsSameLength_1() {
    //     final ImmutableList first = new Cons(1, new Nil());
    //     final ImmutableList second = new Cons(2, new Nil());
    //     final ImmutableList expected = new Cons(1, new Cons(2, new Nil()));
    //     assertEquals(expected, first.append(second));
    // } // appendConsConsSameLength_1

    // @Test
    // public void appendConsConsSameLength_2() {
    //     final ImmutableList first = new Cons(2, new Nil());
    //     final ImmutableList second = new Cons(1, new Nil());
    //     final ImmutableList expected = new Cons(2, new Cons(1, new Nil()));
    //     assertEquals(expected, first.append(second));
    // } // appendConsConsSameLength_2

    // @Test
    // public void appendConsConsDifferentLength_1() {
    //     final ImmutableList first = new Cons(1, new Cons(2, new Cons(1, new Nil())));
    //     final ImmutableList second = new Cons(-1, new Cons(1, new Nil()));
    //     final ImmutableList expected =
    //         new Cons(1, new Cons(2, new Cons(1, new Cons(-1, new Cons(1, new Nil())))));
    //     assertEquals(expected, first.append(second));
    // } // appendConsConsDifferentLength_1

    // @Test
    // public void appendConsConsDifferentLength_2() {
    //     final ImmutableList first = new Cons(2, new Cons(1, new Nil()));
    //     final ImmutableList second = new Cons(-1, new Cons(-2, new Cons(-3, new Nil())));
    //     final ImmutableList expected =
    //         new Cons(2, new Cons(1, new Cons(-1, new Cons(-2, new Cons(-3, new Nil())))));
    //     assertEquals(expected, first.append(second));
    // } // appendConsConsDifferentLength_2

    // @Test
    // public void appendConsConsDifferentLength_3() {
    //     final ImmutableList first = new Cons(0, new Nil());
    //     final ImmutableList second = new Cons(1, new Cons(2, new Nil()));
    //     final ImmutableList expected = new Cons(0, new Cons(1, new Cons(2, new Nil())));
    //     assertEquals(expected, first.append(second));
    // } // appendConsConsDifferentLength_3

    // @Test
    // public void appendConsConsDifferentLength_4() {
    //     final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
    //     final ImmutableList second = new Cons(3, new Nil());
    //     final ImmutableList expected = new Cons(1, new Cons(2, new Cons(3, new Nil())));
    //     assertEquals(expected, first.append(second));
    // } // appendConsConsDifferentLength_4
    // // ---END APPEND TESTS---

    // // ---BEGIN CONTAINS TESTS---
    // @Test
    // public void containsNil() {
    //     assertFalse(new Nil().contains(5));
    // } // containsNil

    // @Test
    // public void containsFirstElement() {
    //     assertTrue(new Cons(1, new Nil()).contains(1));
    // } // containsFirstElement

    // @Test
    // public void containsSecondElement() {
    //     assertTrue(new Cons(1, new Cons(-3, new Nil())).contains(-3));
    // } // containsSecondElement

    // @Test
    // public void containsThirdElement() {
    //     assertTrue(new Cons(0, new Cons(1, new Cons(2, new Nil()))).contains(2));
    // } // containsThirdElement

    // @Test
    // public void doesNotContain() {
    //     assertFalse(new Cons(0, new Cons(-1, new Cons(1, new Nil()))).contains(3));
    // } // doesNotContain
    // // ---END CONTAINS TESTS---

    // ---BEGIN TOSTRING TESTS---
    @Test
    public void toStringNil() {
        assertEquals("Nil", new Nil().toString());
    } // toStringNil

    @Test
    public void toStringLength1() {
        assertEquals("Cons(1, Nil)", new Cons(1, new Nil()).toString());
    } // toStringLength1

    @Test
    public void toStringLength2() {
        final ImmutableList list = new Cons(1, new Cons(2, new Nil()));
        assertEquals("Cons(1, Cons(2, Nil))", list.toString());
    } // toStringLength2

    @Test
    public void toStringLength3() {
        final ImmutableList list = new Cons(-1, new Cons(-2, new Cons(3, new Nil())));
        assertEquals("Cons(-1, Cons(-2, Cons(3, Nil)))", list.toString());
    } // toStringLength3

    @Test
    public void toStringLength4() {
        final ImmutableList list = new Cons(0, new Cons(1, new Cons(2, new Cons(3, new Nil()))));
        assertEquals("Cons(0, Cons(1, Cons(2, Cons(3, Nil))))", list.toString());
    } // toStringLength4
    // ---END TOSTRING TESTS

    @Test
    public void isEmptyNil() {
        assertTrue(new Nil().isEmpty());
    }

    @Test
    public void isEmptyCons() {
        // [1]
        final ImmutableList list = new Cons(1, new Nil());
        assertFalse(list.isEmpty());
    }

    // [].addAmount(3) -> []
    @Test
    public void addAmountEmpty() {
        // assertEquals(expected, received)
        assertEquals(new Nil(), new Nil().addAmount(3));
    }

    // public static void takesCons(final Cons c) {}

    // public static void takesMouse(final Mouse m) {}
    
    // [1, 2, 3].addAmount(5) -> [6, 7, 8]
    @Test
    public void addAmountNonEmpty() {
        final ImmutableList input =
            new Cons(1, new Cons(2, new Cons(3, new Nil())));
        final ImmutableList output =
            new Cons(6, new Cons(7, new Cons(8, new Nil())));

        // final Cons input =
        //     new Cons(1, new Cons(2, new Cons(3, new Nil())));
        // final Cons output =
        //     new Cons(6, new Cons(7, new Cons(8, new Nil())));

        assertEquals(output, input.addAmount(5));

        // final Cons someCons = new Cons(1, new Nil());
        // takesCons(someCons);

        // final ImmutableList someOtherCons = new Cons(2, new Nil());
        // takesCons((Cons)someOtherCons);

        // final Mouse someMouse = new Mouse();
        // takesMouse(someMouse);

        // final Animal someOtherMouse = new Mouse();
        // takesMouse(someOtherMouse); // won't compile
    }
} // ImmutableListTest
