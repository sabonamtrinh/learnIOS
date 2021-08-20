import UIKit
import RxSwift

let bag = DisposeBag()

//Prefixing and concatenating

//Observable.of("b", "c", "d")
//    .startWith("a")
//    .subscribe { event in
//        print(event)
//    }
//    .disposed(by: bag)

// Concat

//let first = Observable.of(1, 2, 3)
//let second = Observable.of(4, 5, 6)

//Observable.concat([first, second])
//    .subscribe { event in
//        print(event)
//    }
//    .disposed(by: bag)

//let observable = first.concat(second)

// ConcatMap

//let cities = [ "MB": Observable.of("HN", "BG"),
//               "MT": Observable.of("TH", "NA"),
//               "MN": Observable.of("HCM"," DN")]
//let observale = Observable.of("MB", "MT", "MN")
//    .concatMap { name in
//        cities[name] ?? .empty()
//    }
//    .subscribe { event in
//        print(event)
//    }
//    .disposed(by: bag)

// Merge

let chu = PublishSubject<String>()
let so = PublishSubject<String>()

let source = Observable.of(chu.asObservable(), so.asObservable())

let observable = source.merge()

observable.subscribe { event in
    print(event)
}
.disposed(by: bag)

chu.onNext("Một")
so.onNext("1")
chu.onNext("Hai")
so.onNext("2")
chu.onNext("Ba")
so.onCompleted()
so.onNext("3")
chu.onNext("Bốn")
chu.onCompleted()


