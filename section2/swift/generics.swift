// Generic type
// A is a type variable; A is a type parameter
indirect enum MyList<A> {
  case Cons(A, MyList<A>)
  case Nil
}

func onlyForInt(list: MyList<Int>) -> Int {
    return 42;
}

func length(list: MyList<String>) -> Int { return 0; }

func somethingElse<A>(list: MyList<A>) -> Int {
    return length(list: list)
}

// parameterized by type A
func length<A>(list: MyList<A>) -> Int {
    switch list {
        case .Nil:
            return 0
        case .Cons(_, let tail):
            return length(list: tail) + 1
    }
}

func sameLength<A, B>(list1: MyList<A>, list2: MyList<B>) -> Bool {
    return true;
}

// MyList<Int> is a type
// MyList<String> is a type
let list1: MyList<Int> = MyList.Cons(1, MyList.Cons(2, MyList.Cons(3, MyList.Nil)))
let list2: MyList<String> = MyList.Cons("foo", MyList.Cons("bar", MyList.Nil))
let list3: MyList<Any> = MyList.Cons("foo", MyList.Cons(1, MyList.Cons(true, MyList.Nil)))

sameLength(list1: list1, list2: list2)
sameLength(list1: list1, list2: list2)

//onlyForInt(list: list2)

// JavaScript
// new Cons(1, new Cons(2, new Nil()))
// new Cons("foo", new Cons("bar", new Nil()))

print(length(list: list1))
print(somethingElse(list: list2))

let tup: (Int, String, Bool, Double, Int) = (1, "foo", true, 3.14, 42)
