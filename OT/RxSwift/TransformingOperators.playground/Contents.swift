import UIKit
import RxSwift

let bag = DisposeBag()

// To Array
//Observable.of(1,2,3,4,5)
//    .toArray()
//    .subscribe { value in
//        print(value)
//    } onError: { error in
//        print(error)
//    }
//    .disposed(by: bag)

// Map
//let formatter = NumberFormatter()
//formatter.numberStyle = .spellOut
//
//Observable<Int>.of(1, 2, 3, 4, 5, 10, 999, 9999, 1000000)
//    .map { formatter.string(for: $0) ?? "" }
//    .subscribe(onNext: { string in
//        print(string)
//    })
//    .disposed(by: bag)

// Enumrated
//Observable.of(1, 2, 3, 4, 5, 6)
//    .enumerated()
//    .map { index, integer in
//        index > 2 ? integer * 2 : integer
//    }
//    .subscribe(onNext: { print($0) })
//    .disposed(by: bag)


// Transforming inner observables

struct User {
    let message: BehaviorSubject<String>
}

let cuTy = User(message: BehaviorSubject(value: "Cu Tý chào bạn!"))
let cuTeo = User(message: BehaviorSubject(value: "Cu Tèo chào bạn!"))

let subject = PublishSubject<User>()

//subject
//    .flatMap { $0.message }
//    .subscribe { mess in
//        print(mess)
//    }
//    .disposed(by: bag)
//
//subject.onNext(cuTy)
//
//cuTy.message.onNext("Hello 1")
//cuTy.message.onNext("Hello 2")
//cuTy.message.onNext("Hello 3")
//
//subject.onNext(cuTeo)
//
//cuTeo.message.onNext("Teo1")

subject
    .flatMapLatest { $0.message }
    .subscribe(onNext: { msg in
        print(msg)
    })
    .disposed(by: bag)

// subject
subject.onNext(cuTy)

// cuTy
cuTy.message.onNext("Tý: Có ai ở đây không?")
cuTy.message.onNext("Tý: Có một mình mình thôi à!")
cuTy.message.onNext("Tý: Buồn vậy!")
cuTy.message.onNext("Tý: ....")

// subject
subject.onNext(cuTeo)

// cuTy
cuTy.message.onNext("Tý: Chào Tèo, bạn có khoẻ không?")

// cuTeo
cuTeo.message.onNext("Tèo: Chào Tý, mình khoẻ. Còn bạn thì sao?")

// cuTy
cuTy.message.onNext("Tý: Mình cũng khoẻ luôn")
cuTy.message.onNext("Tý: Mình đứng đây từ chiều nè")

// cuTeo
cuTeo.message.onNext("Tèo: Kệ Tý. Ahihi")
