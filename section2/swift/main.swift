// COMP 333 Assignment 3
//
// You will need to get this code running.  You have two options here:
// 1.) Install Swift locally.  Swift can be downloaded here: https://swift.org/download/#releases
//     Binaries are available for Ubuntu Linux and Mac OS X.
//     You can compile the code with `swiftc main.swift`, and then run it with `./main`.
// 2.) Run Swift online at http://online.swiftplayground.run/.
//
// Once you have a Swift setup working, you can start implementing the assignment.
// Recommended approach:
//
// 1.) Write stubs for all the methods, which just return dummy values.
//     This is to get things compiling.  You'll need the stubs later.
// 2.) Implement isEmpty.  This will require pattern matching (switch) on the list
//     in a similar manner as contentsToString.  isEmpty is relatively easy to
//     implement, and it will get you in the habit of using pattern matching.
// 3.) Implement the rest of the methods, in any particular order.  These
//     can be implemented in any way.  Note that they can also be implemented
//     as calls to foldLeft and foldRight (as is mapFunction)
//
// Hints:
// 1.) The test suite is large, and covers a lot of behavior this code needs.
//     At a minimum, the test suite provides enough detail to write stubs for each
//     of the methods you need to define.  The test suite also has a lot of examples
//     which call Swift code.
// 2.) While Swift has classes, you don't need classes for this assignment.
// 3.) Many different implementations are possible.
// 4.) My implementation's components have the following sizes (in lines of code):
//     - isEmpty: 8
//     - append: 8
//     - length: 8
//     - filter: 12
//     - contains: 8
//     - sum: 8
//     If you start needing significantly more code than this for any of these parts, we
//     should talk to make sure you're still on track.
//

indirect enum MyList<A> {
    case cons(A, MyList<A>)
    case empty
}

extension MyList {
    func map<B>(mapper: (A) -> B) -> MyList<B> {
        // Ideally, this should be a method.
        // However, this is needed to bypass some bugs which I'll be filing
        // later.
        return mapFunction(list: self, mapper: mapper)
    } // map

    private func contentsToString(_ innerToString: (A) -> String) -> String {
        switch self {
        case let .cons(head, .empty): // list containing one element
            return innerToString(head)
        case let .cons(head, tail): // list containing more than one element
            return innerToString(head) + ", " + tail.contentsToString(innerToString)
        case .empty: // empty list
            return ""
        }
    } // contentsToString
    
    func toString(innerToString: (A) -> String) -> String {
        return "[" + contentsToString(innerToString) + "]"
    } // toString

    func equals(otherList: MyList<A>, compareInner: (A, A) -> Bool) -> Bool {
        switch (self, otherList) {
        case let (.cons(head1, tail1), .cons(head2, tail2)):
            return compareInner(head1, head2) && tail1.equals(otherList: tail2, compareInner: compareInner)
        case (.empty, .empty):
            return true
        case _:
            return false
        }
    } // equals
} // extension MyList

// This should be a method, but we can't do this because of a bug in 
// Swift's typechecker
func mapFunction<A, B>(list: MyList<A>, mapper: (A) -> B) -> MyList<B> {
    switch list {
    case let .cons(head, tail):
        return MyList.cons(mapper(head), mapFunction(list: tail, mapper: mapper))
    case .empty:
        return MyList.empty
    }
} // map

// ---BEGIN TEST SUITE---
func assertEqualsBase<A>(testName: String,
                         compare: (A, A) -> Bool,
                         toString: (A) -> String,
                         expected: A,
                         received: A) {
    print(testName + ": ", terminator: "")
    if !compare(expected, received) {
        print("FAIL")
        print("\tExpected: " + toString(expected))
        print("\tReceived: " + toString(received))
    } else {
        print("pass")
    }
} // assertEqualsBase

func assertEquals(testName: String,
                  expected: MyList<Int>,
                  received: MyList<Int>) {
    assertEqualsBase(testName: testName,
                     compare: { (list1, list2) in
                         list1.equals(otherList: list2, compareInner: ==) },
                     toString: { list in
                         list.toString(innerToString: { i in i.description }) },
                     expected: expected,
                     received: received)
} // assertEquals

func assertEquals(testName: String,
                  expected: MyList<String>,
                  received: MyList<String>) {
    assertEqualsBase(testName: testName,
                     compare: { (list1, list2) in
                         list1.equals(otherList: list2, compareInner: ==) },
                     toString: { list in
                         list.toString(innerToString: { s in s }) },
                     expected: expected,
                     received: received)
} // assertEquals

func assertEquals(testName: String,
                  expected: Bool,
                  received: Bool) {
    assertEqualsBase(testName: testName,
                     compare: ==,
                     toString: { b in b.description },
                     expected: expected,
                     received: received)
} // assertEquals

func assertEquals(testName: String,
                  expected: Int,
                  received: Int) {
    assertEqualsBase(testName: testName,
                     compare: ==,
                     toString: { i in i.description },
                     expected: expected,
                     received: received)
} // assertEquals

func assertEquals(testName: String,
                  expected: String,
                  received: String) {
    assertEqualsBase(testName: testName,
                     compare: ==,
                     toString: { s in s },
                     expected: expected,
                     received: received)
} // assertEquals

func test_isEmpty_empty() {
    let list: MyList<Int> = MyList.empty
    assertEquals(testName: "test_isEmpty_empty",
                 expected: true,
                 received: list.isEmpty())
} // test_isEmpty_empty

func test_isEmpty_cons() {
    let list = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_isEmpty_cons",
                 expected: false,
                 received: list.isEmpty())
} // test_isEmpty_cons

func test_append_empty_empty() {
    let list1: MyList<Int> = MyList.empty
    let list2: MyList<Int> = MyList.empty
    assertEquals(testName: "test_append_empty_empty",
                 expected: MyList.empty,
                 received: list1.append(other: list2))
} // test_append_empty_empty

func test_append_empty_cons_1() {
    let list1: MyList<Int> = MyList.empty
    let list2 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_append_empty_cons_1",
                 expected: MyList.cons(1, MyList.empty),
                 received: list1.append(other: list2))
} // test_append_empty_cons_1

func test_append_empty_cons_2() {
    let list1: MyList<Int> = MyList.empty
    let list2 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_append_empty_cons_2",
                 expected: MyList.cons(1, MyList.cons(2, MyList.empty)),
                 received: list1.append(other: list2))
} // test_append_empty_cons_2

func test_append_cons_1_empty() {
    let list1 = MyList.cons(1, MyList.empty)
    let list2: MyList<Int> = MyList.empty
    assertEquals(testName: "test_append_cons_1_empty",
                 expected: MyList.cons(1, MyList.empty),
                 received: list1.append(other: list2))
} // test_append_cons_1_empty

func test_append_cons_2_empty() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    let list2: MyList<Int> = MyList.empty
    assertEquals(testName: "test_append_cons_2_empty",
                 expected: MyList.cons(1, MyList.cons(2, MyList.empty)),
                 received: list1.append(other: list2))
} // test_append_cons_2_empty

func test_append_cons_1_cons_1() {
    let list1 = MyList.cons(1, MyList.empty)
    let list2 = MyList.cons(2, MyList.empty)
    assertEquals(testName: "test_append_cons_1_cons_1",
                 expected: MyList.cons(1, MyList.cons(2, MyList.empty)),
                 received: list1.append(other: list2))
} // test_append_cons_1_cons_1

func test_append_cons_1_cons_2() {
    let list1 = MyList.cons(1, MyList.empty)
    let list2 = MyList.cons(2, MyList.cons(3, MyList.empty))
    assertEquals(testName: "test_append_cons_1_cons_2",
                 expected: MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty))),
                 received: list1.append(other: list2))
} // test_append_cons_1_cons_2

func test_append_cons_2_cons_1() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    let list2 = MyList.cons(3, MyList.empty)
    assertEquals(testName: "test_append_cons_2_cons_1",
                 expected: MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty))),
                 received: list1.append(other: list2))
} // test_append_cons_2_cons_1

func test_append_cons_2_cons_2() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    let list2 = MyList.cons(3, MyList.cons(4, MyList.empty))
    assertEquals(testName: "test_append_cons_2_cons_2",
                 expected: MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.cons(4, MyList.empty)))),
                 received: list1.append(other: list2))
} // test_append_cons_2_cons_2

func test_length_empty() {
    let list1: MyList<Int> = MyList.empty
    assertEquals(testName: "test_length_empty",
                 expected: 0,
                 received: list1.length())
} // test_length_empty

func test_length_cons_1() {
    let list1 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_length_cons_1",
                 expected: 1,
                 received: list1.length())
} // test_length_cons_1

func test_length_cons_2() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_length_cons_2",
                 expected: 2,
                 received: list1.length())
} // test_length_cons_2

func test_length_cons_3() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))
    assertEquals(testName: "test_length_cons_2",
                 expected: 3,
                 received: list1.length())
} // test_length_cons_3

func test_map_empty_1() {
    let list1: MyList<Int> = MyList.empty
    let expected: MyList<Int> = MyList.empty
    assertEquals(testName: "test_map_empty_1",
                 expected: expected,
                 received: list1.map(mapper: { i in i + 1}))
} // test_map_empty_1

func test_map_empty_2() {
    let list1: MyList<Bool> = MyList.empty
    let expected: MyList<Int> = MyList.empty
    assertEquals(testName: "test_map_empty_2",
                 expected: expected,
                 received: list1.map(mapper: { _ in 5 }))
} // test_map_empty_2

func test_map_cons_1_lengths() {
    let list1 = MyList.cons("foo", MyList.empty)
    assertEquals(testName: "test_map_cons_1_lengths",
                 expected: MyList.cons(3, MyList.empty),
                 received: list1.map(mapper: { s in s.count }))
} // test_map_cons_1_lengths

func test_map_cons_2_lengths() {
    let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.empty))
    assertEquals(testName: "test_map_cons_2_lengths",
                 expected: MyList.cons(3, MyList.cons(6, MyList.empty)),
                 received: list1.map(mapper: { s in s.count }))
} // test_map_cons_2_lengths

func test_map_cons_3_lengths() {
    let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.cons("apple", MyList.empty)))
    assertEquals(testName: "test_map_cons_3_lengths",
                 expected: MyList.cons(3, MyList.cons(6, MyList.cons(5, MyList.empty))),
                 received: list1.map(mapper: { s in s.count }))
} // test_map_cons_3_lengths

func test_map_cons_1_strings() {
    let list1 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_map_cons_1_strings",
                 expected: MyList.cons("1", MyList.empty),
                 received: list1.map(mapper: { i in i.description }))
} // test_map_cons_1_strings

func test_map_cons_2_strings() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_map_cons_2_strings",
                 expected: MyList.cons("1", MyList.cons("2", MyList.empty)),
                 received: list1.map(mapper: { i in i.description }))
} // test_map_cons_2_strings

func test_map_cons_3_strings() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))
    assertEquals(testName: "test_map_cons_3_strings",
                 expected: MyList.cons("1", MyList.cons("2", MyList.cons("3", MyList.empty))),
                 received: list1.map(mapper: { i in i.description }))
} // test_map_cons_3_strings

func test_filter_empty_integers() {
    let list1: MyList<Int> = MyList.empty
    assertEquals(testName: "test_filter_empty_integers",
                 expected: MyList.empty,
                 received: list1.filter(predicate: { i in i > 5 }))
} // test_filter_empty_integers

func test_filter_empty_strings() {
    let list1: MyList<String> = MyList.empty
    assertEquals(testName: "test_filter_empty_strings",
                 expected: MyList.empty,
                 received: list1.filter(predicate: { s in s.count > 3 }))
} // test_filter_empty_strings

func test_filter_cons_1_integers() {
    let list1 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_filter_cons_1_integers",
                 expected: MyList.empty,
                 received: list1.filter(predicate: { i in i > 5 }))
} // test_filter_cons_1_integers

func test_filter_cons_2_integers() {
    let list1 = MyList.cons(1, MyList.cons(6, MyList.empty))
    assertEquals(testName: "test_filter_cons_2_integers",
                 expected: MyList.cons(6, MyList.empty),
                 received: list1.filter(predicate: { i in i > 5 }))
} // test_filter_cons_2_integers

func test_filter_cons_3_integers() {
    let list1 = MyList.cons(1, MyList.cons(6, MyList.cons(7, MyList.empty)))
    assertEquals(testName: "test_filter_cons_3_integers",
                 expected: MyList.cons(6, MyList.cons(7, MyList.empty)),
                 received: list1.filter(predicate: { i in i > 5 }))
} // test_filter_cons_3_integers

func test_filter_cons_4_integers() {
    let list1 = MyList.cons(1, MyList.cons(6, MyList.cons(7, MyList.cons(3, MyList.empty))))
    assertEquals(testName: "test_filter_cons_4_integers",
                 expected: MyList.cons(6, MyList.cons(7, MyList.empty)),
                 received: list1.filter(predicate: { i in i > 5 }))
} // test_filter_cons_4_integers

func test_filter_cons_1_strings() {
    let list1 = MyList.cons("foo", MyList.empty)
    assertEquals(testName: "test_filter_cons_1_strings",
                 expected: MyList.empty,
                 received: list1.filter(predicate: { s in s.count > 3 }))
} // test_filter_cons_1_strings

func test_filter_cons_2_strings() {
    let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.empty))
    assertEquals(testName: "test_filter_cons_2_strings",
                 expected: MyList.cons("foobar", MyList.empty),
                 received: list1.filter(predicate: { s in s.count > 3 }))
} // test_filter_cons_2_strings

func test_filter_cons_3_strings() {
    let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.cons("a", MyList.empty)))
    assertEquals(testName: "test_filter_cons_3_strings",
                 expected: MyList.cons("foobar", MyList.empty),
                 received: list1.filter(predicate: { s in s.count > 3 }))
} // test_filter_cons_3_strings

func test_filter_cons_4_strings() {
    let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.cons("a", MyList.cons("apple", MyList.empty))))
    assertEquals(testName: "test_filter_cons_4_strings",
                 expected: MyList.cons("foobar", MyList.cons("apple", MyList.empty)),
                 received: list1.filter(predicate: { s in s.count > 3 }))
} // test_filter_cons_4_strings

func test_toString_empty_integers() {
    let list1: MyList<Int> = MyList.empty
    assertEquals(testName: "test_toString_empty_integers",
                 expected: "[]",
                 received: list1.toString(innerToString: { i in i.description }))
} // test_toString_empty_integers

func test_toString_cons_1_integers() {
    let list1 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_toString_cons_1_integers",
                 expected: "[1]",
                 received: list1.toString(innerToString: { i in i.description }))
} // test_toString_cons_1_integers

func test_toString_cons_2_integers() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_toString_cons_2_integers",
                 expected: "[1, 2]",
                 received: list1.toString(innerToString: { i in i.description }))
} // test_toString_cons_2_integers

func test_toString_cons_3_integers() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))
    assertEquals(testName: "test_toString_cons_3_integers",
                 expected: "[1, 2, 3]",
                 received: list1.toString(innerToString: { i in i.description }))
} // test_toString_cons_3_integers

func test_toString_empty_strings() {
    let list1: MyList<String> = MyList.empty
    assertEquals(testName: "test_toString_empty_strings",
                 expected: "[]",
                 received: list1.toString(innerToString: { s in s }))
} // test_toString_empty_strings

func test_toString_cons_1_strings() {
    let list1 = MyList.cons("foo", MyList.empty)
    assertEquals(testName: "test_toString_cons_1_strings",
                 expected: "[foo]",
                 received: list1.toString(innerToString: { s in s }))
} // test_toString_cons_1_strings

func test_toString_cons_2_strings() {
    let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))
    assertEquals(testName: "test_toString_cons_2_strings",
                 expected: "[foo, bar]",
                 received: list1.toString(innerToString: { s in s }))
} // test_toString_cons_2_strings

func test_toString_cons_3_strings() {
    let list1 = MyList.cons("foo", MyList.cons("bar", MyList.cons("baz", MyList.empty)))
    assertEquals(testName: "test_toString_cons_3_strings",
                 expected: "[foo, bar, baz]",
                 received: list1.toString(innerToString: { s in s }))
} // test_toString_cons_3_strings

func test_contains_empty_integers() {
    let list1: MyList<Int> = MyList.empty
    assertEquals(testName: "test_contains_empty_integers",
                 expected: false,
                 received: list1.contains(target: 1, compare: ==))
} // test_contains_empty_integers

func test_contains_empty_strings() {
    let list1: MyList<String> = MyList.empty
    assertEquals(testName: "test_contains_empty_strings",
                 expected: false,
                 received: list1.contains(target: "foo", compare: ==))
} // test_contains_empty_strings

func test_contains_cons_1_integers_1() {
    let list1 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_contains_cons_1_integers_1",
                 expected: false,
                 received: list1.contains(target: 0, compare: ==))
} // test_contains_cons_1_integers_1

func test_contains_cons_1_integers_2() {
    let list1 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_contains_cons_1_integers_2",
                 expected: true,
                 received: list1.contains(target: 1, compare: ==))
} // test_contains_cons_1_integers_2

func test_contains_cons_2_integers_1() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_contains_cons_2_integers_1",
                 expected: false,
                 received: list1.contains(target: 0, compare: ==))
} // test_contains_cons_2_integers_1

func test_contains_cons_2_integers_2() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_contains_cons_2_integers_2",
                 expected: true,
                 received: list1.contains(target: 1, compare: ==))
} // test_contains_cons_2_integers_2

func test_contains_cons_2_integers_3() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_contains_cons_2_integers_3",
                 expected: true,
                 received: list1.contains(target: 2, compare: ==))
} // test_contains_cons_2_integers_3

func test_contains_cons_1_strings_1() {
    let list1 = MyList.cons("foo", MyList.empty)
    assertEquals(testName: "test_contains_cons_1_strings_1",
                 expected: false,
                 received: list1.contains(target: "blah", compare: ==))
} // test_contains_cons_1_strings_1

func test_contains_cons_1_strings_2() {
    let list1 = MyList.cons("foo", MyList.empty)
    assertEquals(testName: "test_contains_cons_1_strings_2",
                 expected: true,
                 received: list1.contains(target: "foo", compare: ==))
} // test_contains_cons_1_strings_2

func test_contains_cons_2_strings_1() {
    let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))
    assertEquals(testName: "test_contains_cons_2_strings_1",
                 expected: false,
                 received: list1.contains(target: "blah", compare: ==))
} // test_contains_cons_2_strings_1

func test_contains_cons_2_strings_2() {
    let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))
    assertEquals(testName: "test_contains_cons_2_strings_2",
                 expected: true,
                 received: list1.contains(target: "foo", compare: ==))
} // test_contains_cons_2_strings_2

func test_contains_cons_2_strings_3() {
    let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))
    assertEquals(testName: "test_contains_cons_2_strings_3",
                 expected: true,
                 received: list1.contains(target: "bar", compare: ==))
} // test_contains_cons_2_strings_3

func test_sum_empty() {
    let list1: MyList<Int> = MyList.empty
    assertEquals(testName: "test_sum_empty",
                 expected: 0,
                 received: list1.sum(zero: 0, add: +))
} // test_sum_empty

func test_sum_cons_1() {
    let list1 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_sum_cons_1",
                 expected: 1,
                 received: list1.sum(zero: 0, add: +))
} // test_sum_cons_1

func test_sum_cons_2() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_sum_cons_2",
                 expected: 3,
                 received: list1.sum(zero: 0, add: +))
} // test_sum_cons_2

func test_sum_cons_3() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))
    assertEquals(testName: "test_sum_cons_3",
                 expected: 6,
                 received: list1.sum(zero: 0, add: +))
} // test_sum_cons_3

func test_equals_empty_lists() {
    let list1: MyList<Int> = MyList.empty
    let list2: MyList<Int> = MyList.empty
    assertEquals(testName: "test_equals_empty_lists",
                 expected: true,
                 received: list1.equals(otherList: list2, compareInner: ==))
} // test_equals_empty_lists

func test_equals_cons_1_are_equal() {
    let list1 = MyList.cons(1, MyList.empty)
    let list2 = MyList.cons(1, MyList.empty)
    assertEquals(testName: "test_equals_cons_1_are_equal",
                 expected: true,
                 received: list1.equals(otherList: list2, compareInner: ==))
} // test_equals_cons_1_are_equal

func test_equals_cons_1_are_not_equal_different_contents() {
    let list1 = MyList.cons(1, MyList.empty)
    let list2 = MyList.cons(2, MyList.empty)
    assertEquals(testName: "test_equals_cons_1_are_not_equal_different_contents",
                 expected: false,
                 received: list1.equals(otherList: list2, compareInner: ==))
} // test_equals_cons_1_are_not_equal_different_contents

func test_equals_cons_1_are_not_equal_different_lengths() {
    let list1 = MyList.cons(1, MyList.empty)
    let list2 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_equals_cons_1_are_not_equal_different_lengths",
                 expected: false,
                 received: list1.equals(otherList: list2, compareInner: ==))
} // test_equals_cons_1_are_not_equal_different_lengths

func test_equals_cons_2_are_equal() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    let list2 = MyList.cons(1, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_equals_cons_2_are_equal",
                 expected: true,
                 received: list1.equals(otherList: list2, compareInner: ==))
} // test_equals_cons_2_are_equal

func test_equals_cons_2_are_not_equal_different_contents_1() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    let list2 = MyList.cons(2, MyList.cons(2, MyList.empty))
    assertEquals(testName: "test_equals_cons_2_are_not_equal_different_contents_1",
                 expected: false,
                 received: list1.equals(otherList: list2, compareInner: ==))
} // test_equals_cons_2_are_not_equal_different_contents_1

func test_equals_cons_2_are_not_equal_different_contents_2() {
    let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
    let list2 = MyList.cons(1, MyList.cons(3, MyList.empty))
    assertEquals(testName: "test_equals_cons_2_are_not_equal_different_contents_2",
                 expected: false,
                 received: list1.equals(otherList: list2, compareInner: ==))
} // test_equals_cons_2_are_not_equal_different_contents_2

func runTests() {
    // isEmpty
    test_isEmpty_empty()
    test_isEmpty_cons()

    // append
    test_append_empty_empty()
    test_append_empty_cons_1()
    test_append_empty_cons_2()
    test_append_cons_1_empty()
    test_append_cons_2_empty()
    test_append_cons_1_cons_1()
    test_append_cons_1_cons_2()
    test_append_cons_2_cons_1()
    test_append_cons_2_cons_2()

    // length
    test_length_empty()
    test_length_cons_1()
    test_length_cons_2()
    test_length_cons_3()

    // map
    test_map_empty_1()
    test_map_empty_2()
    test_map_cons_1_lengths()
    test_map_cons_2_lengths()
    test_map_cons_3_lengths()
    test_map_cons_1_strings()
    test_map_cons_2_strings()
    test_map_cons_3_strings()

    // filter
    test_filter_empty_integers()
    test_filter_empty_strings()
    test_filter_cons_1_integers()
    test_filter_cons_2_integers()
    test_filter_cons_3_integers()
    test_filter_cons_4_integers()
    test_filter_cons_1_strings()
    test_filter_cons_2_strings()
    test_filter_cons_3_strings()
    test_filter_cons_4_strings()

    // toString
    test_toString_empty_integers()
    test_toString_cons_1_integers()
    test_toString_cons_2_integers()
    test_toString_cons_3_integers()
    test_toString_empty_strings()
    test_toString_cons_1_strings()
    test_toString_cons_2_strings()
    test_toString_cons_3_strings()

    // contains
    test_contains_empty_integers()
    test_contains_empty_strings()
    test_contains_cons_1_integers_1()
    test_contains_cons_1_integers_2()
    test_contains_cons_2_integers_1()
    test_contains_cons_2_integers_2()
    test_contains_cons_2_integers_3()
    test_contains_cons_1_strings_1()
    test_contains_cons_1_strings_2()
    test_contains_cons_2_strings_1()
    test_contains_cons_2_strings_2()
    test_contains_cons_2_strings_3()

    // sum
    test_sum_empty()
    test_sum_cons_1()
    test_sum_cons_2()
    test_sum_cons_3()

    // equals
    test_equals_empty_lists()
    test_equals_cons_1_are_equal()
    test_equals_cons_1_are_not_equal_different_contents()
    test_equals_cons_1_are_not_equal_different_lengths()
    test_equals_cons_2_are_equal()
    test_equals_cons_2_are_not_equal_different_contents_1()
    test_equals_cons_2_are_not_equal_different_contents_2()
} // runTests
// ---END TEST SUITE---

// ---BEGIN MAIN---
runTests()
// ---END MAIN---

