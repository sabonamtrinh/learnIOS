import UIKit
import RxSwift
import RxCocoa

//let ios = 1
//let ad = 2
//let php = 3
//
// MARK: Basic
//let ob1 = Observable<Int>.just(ios)
//
//let ob2 = Observable.of(ios,ad,php)
//
//let ob3 = Observable.of([ios, ad, php])
//
//let ob4 = Observable.from([ios, ad, php])
//
//ob3.subscribe { event in
//    if let element = event.element {
//        print(element)
//    }
//}
//
//ob4.subscribe { value in
//    print(value)
//} onError: { error in
//    print(error)
//} onCompleted: {
//    print("Completed")
//} onDisposed: {
//    print("Disposed")
//}
//
//let ob5 = Observable<Void>.empty()
//
//ob5.subscribe { value in
//    print(value)
//} onCompleted: {
//    print("Completed")
//}
//
//let ob6 = Observable<Any>.never()
//
//ob6.subscribe { value in
//    print(value)
//} onCompleted: {
//    print("Completed")
//}

//let ob7 = Observable<Int>.range(start: 1, count: 10)
//var sum = 0
//
//ob7.subscribe { i in
//    sum += i
//} onCompleted: {
//    print(sum)
//    print("Completed 7")
//}


//let ob8 = Observable<String>.of("A", "B", "C", "D", "E", "F")
//
//let subscription = ob8.subscribe { event in
//    print(event)
//}
//subscription.dispose()
enum MyError: Error {
    case anError
    case pathError
    case failedCaching
}
let bag = DisposeBag()

// MARK: Create

//Observable<String>.create { observer -> Disposable in
//    observer.onNext("1")
//    observer.onNext("2")
//    observer.onNext("3")
//    observer.onNext("4")
//    observer.onError(MyError.anError)
//    observer.onNext("5")
//    return Disposables.create()
//}
//.subscribe { print($0)
//} onError: {  print($0)
//} onCompleted: { print("Completed")
//} onDisposed: { print("Disposed")
//}.disposed(by: bag)


// MARK: Observable factories

//var flip = true
//
//let factory = Observable<Int>.deferred {
//    flip.toggle()
//
//    if flip {
//        return Observable.of(1)
//    } else {
//        return Observable.of(0)
//    }
//}
//
//for _ in 1...10 {
//    factory.subscribe {
//        print($0, terminator: "")
//    }.disposed(by: bag)
//    print()
//}

// MARK: Trait

//struct Single<Element> {
//    let source: Observable<Element>
//}
//
//struct Driver<Element> {
//    let source: Observable<Element>
//}

// MARK: Trait - Single

//func readFile(path: String?) -> Single<String> {
//    return Single.create { single -> Disposable in
//        if let path = path {
//            single(.success("Success!"))
//        } else {
//            single(.error(MyError.pathError))
//        }
//
//        return Disposables.create()
//    }
//}
//
//readFile(path: nil).subscribe { event in
//    switch event {
//    case .success(let event):
//        print(event)
//    case .error(let error):
//        print(error)
//    }
//}.disposed(by: bag)


// MARK: Trait - Completable

//func cacheLocally() -> Completable {
//    return Completable.create { completable in
//        // Store data in locally
//
//        let success = false
//        guard success else {
//            completable(.error(MyError.failedCaching))
//            return Disposables.create { }
//        }
//
//        completable(.completed)
//        return Disposables.create { }
//    }
//}
//
//cacheLocally().subscribe { completable in
//    switch completable {
//    case .completed:
//        print("Completed!")
//    case .error(let error):
//        print(error)
//    }
//}
//.disposed(by: bag)

// MARK: Trait - Maybe

//func generateString() -> Maybe<String> {
//    return Maybe.create { maybe in
//        maybe(.success("Success!"))
//
//        // OR
//        maybe(.completed)
//
//        // OR
//        maybe(.error(MyError.anError))
//        return Disposables.create { }
//    }
//}
//
//generateString()
//    .subscribe { maybe in
//        switch maybe {
//        case .success(let element):
//            print("Completed with element \(element)")
//        case .completed:
//            print("Completed with no element")
//        case .error(let error):
//            print("Completed with an error \(error.localizedDescription)")
//        }
//    }
//    .disposed(by: bag)

// MARK: Publish Subjects

//let subject = PublishSubject<String>()
//
//subject.onNext("chao 1")
//
//let sub1 = subject.subscribe { value in
//    print("Sub1: \(value)")
//}
//
//subject.onNext("chao 2")
//subject.onNext("chao 3")
//subject.onNext("chao 4")
//
//subject.onCompleted()
//
//let sub2 = subject.subscribe { value in
//    print("Sub2: \(value)")
//}

// MARK: Behavior Subjects

//let subject = BehaviorSubject(value: "0")
//
//subject.subscribe {
//    print("A", $0)
//}
//.disposed(by: bag)
//
//subject.onNext("1")
//
//subject.subscribe {
//    print("B", $0)
//}
//.disposed(by: bag)
//
//subject.onError(MyError.anError)
//
//subject.subscribe {
//    print("C", $0)
//}
//.disposed(by: bag)

// MARK: Relay Subject

//let subject = ReplaySubject<String>.create(bufferSize: 2) // Luu 2
//let subject2 = ReplaySubject<String>.createUnbounded() // Luu tat ca
//
//subject.onNext("0")
//subject.onNext("1")
//subject.onNext("2")
//
//subject.subscribe {
//    print("A", $0)
//}
//.disposed(by: bag)
//
//subject.onNext("3")
//
//subject.subscribe {
//    print("B", $0)
//}
//.disposed(by: bag)
//
//subject.onNext("4")


// MARK: PublishRelay

//let subject = PublishRelay<String>()
//
//subject.accept("0")
//
//subject.subscribe {
//    print("A", $0)
//}
//.disposed(by: bag)
//
//subject.accept("1")
//subject.accept("2")
//
//subject.subscribe {
//    print("B", $0)
//}
//.disposed(by: bag)
//
//subject.accept("3")

// MARK: BehaviorRelay

//let behaviorRelay = BehaviorRelay<String>(value: "0")
//
//behaviorRelay.accept("0")
//
//// subcribe 1
//behaviorRelay
//    .subscribe { print("🔵 ", $0) }
//    .disposed(by: bag)
//
//behaviorRelay.accept("1")
//behaviorRelay.accept("2")
//behaviorRelay.accept("3")
//
//// subcribe 2
//behaviorRelay
//    .subscribe { print("🔴 ", $0) }
//    .disposed(by: bag)
//
//behaviorRelay.accept("4")
//
//// current value
//print("Current value: \(behaviorRelay.value)")

// MARK: Filtering Operators

// Ignoring operators

//let subject = PublishSubject<String>()
//
//subject
//    .elementAt(2)
//    .subscribe { event in
//        print(event)
//    }
//    .disposed(by: bag)
//
//subject.onNext("1")
//subject.onNext("2")
//subject.onNext("3")
//subject.onCompleted()

// Filter

//let array = Array(0...10)
//
//Observable.from(array)
//    .filter { $0 % 2 == 0 }
//    .subscribe(onNext: {
//                print($0) })
//    .disposed(by: bag)

// Skip

//Observable.of("A", "B", "C", "D", "E", "F")
//    .skip(3)
//    .subscribe(onNext: {
//                print($0)
//    })
//    .disposed(by: bag)

//Observable.of(2, 4, 8, 9, 2, 4, 5, 7, 0, 10)
//    .skipWhile { $0 % 2 == 0 }
//    .subscribe(onNext: {
//                print($0) })
//    .disposed(by: bag)

//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()
//
//subject
//    .skipUntil(trigger)
//    .subscribe(onNext: { value in
//        print(value)
//    })
//    .disposed(by: bag)
//
//subject.onNext("1")
//subject.onNext("2")
//
//trigger.onNext("XXX")
//
//subject.onNext("3")
//subject.onNext("4")

//Observable.of(1, 2, 3, 4, 5, 6, 7, 8, 9)
//    .take(4)
//    .subscribe(onNext: { (value) in
//        print(value)
//    })
//    .disposed(by: bag)

//Observable.of(1, 2, 3, 4, 5, 6, 7, 8, 9)
//    .takeWhile { $0 < 4 }
//    .subscribe(onNext: { (value) in
//        print(value)
//    })
//    .disposed(by: bag)

//Observable.of(2, 4, 6, 8, 0, 12, 1, 3, 4, 6, 2)
//    .enumerated()
//    .takeWhile { index, value in
//        value%2 == 0 && index < 3
//    }
//    .subscribe(onNext: { (value) in
//        print(value)
//    })
//    .disposed(by: bag)

//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()
//
//subject
//    .takeUntil(trigger)
//    .subscribe(onNext: { value in
//        print(value)
//    })
//    .disposed(by: bag)
//
//subject.onNext("1")
//subject.onNext("2")
//subject.onNext("3")
//subject.onNext("4")
//subject.onNext("5")
//
//trigger.onNext("XXX")
//
//subject.onNext("6")
//subject.onNext("7")

