import UIKit

class A {
    var number: Int = 5
}

let a = A()
let b = a
b.number = 6

print(a.number)
print(b.number)
