// Generic type
// A is a type variable
// MyList is parameterized by A
indirect enum MyList<A> {
  case Cons(A, MyList<A>)
  case Nil
}

extension MyList {
    func length() -> Int {
        switch self {
        case .Nil:
            return 0
        case .Cons(_, let b):
            return 1 + length(list: b)
        }
    }
}
        
func length<A>(list: MyList<A>) -> Int {
    switch list {
        case .Nil:
            return 0
        case .Cons(_, let b):
            return 1 + length(list: b)
    }
}

func map<A, B>(list: MyList<A>, f: (A) -> B) -> List<B> {
    switch list {
    case .Cons(head, tail):
        return List.Cons(f(head), map(list: tail, f: f))
    case .Nil:
        return List.Nil
    }
}

// Int is a type parameter to MyList
let list1: MyList<Int> = MyList.Cons(1, MyList.Cons(2, MyList.Nil))
let list2: MyList<String> = MyList.Cons("foo", MyList.Nil)

print(length(list: list1))
print(length(list: list2))

extension MyList {
    func length() -> Int {
        // `self` is to Swift as `this` is to Java
        switch self {
            case .Nil:
                return 0
            case .Cons(_, let tail):
                return tail.length() + 1
        }
    }
}

print(length(list: MyList.Cons(1, MyList.Cons(2, MyList.Nil))))
let list = MyList.Cons(1, MyList.Cons(2, MyList.Nil))
print(list.length())

extension Bool {
    func and(_ other: Bool) -> Bool { return self && other }
}

print(true.and(false))
