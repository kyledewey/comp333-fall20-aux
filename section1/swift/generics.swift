// Generic type
// A is a type variable
// MyList is parameterized by A
indirect enum MyList<A> {
  case Cons(A, MyList<A>)
  case Nil
}

func length<A>(list: MyList<A>) -> Int {
    switch list {
        case .Nil:
            return 0
        case .Cons(_, let b):
            return 1 + length(list: b)
    }
}

// Int is a type parameter to MyList
let list1: MyList<Int> = MyList.Cons(1, MyList.Cons(2, MyList.Nil))
let list2: MyList<String> = MyList.Cons("foo", MyList.Nil)

print(length(list: list1))
print(length(list: list2))
