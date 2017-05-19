import Foundation
import RxSwift


extension Observable {
    func doOnNext(_ closure: @escaping (Element) -> Void) -> Observable<Element> {
        return self.do(onNext: { (element) in
            closure(element)
        })
    }
    
    func doOnCompleted(_ closure: @escaping () -> Void) -> Observable<Element> {
        return self.do(onCompleted: {
            closure()
        })
    }
    
    func doOnError(_ closure: @escaping (Error) -> Void) -> Observable<Element> {
        return self.do(onError: { (error) in
            closure(error)
        })
    }
}


protocol BooleanType {
    var boolValue: Bool { get }
}
extension Bool: BooleanType {
    var boolValue: Bool { return self }
}

// Maps true to false and vice versa
extension Observable where Element: BooleanType {
    func not() -> Observable<Bool> {
        return self.map { input in
            return !input.boolValue
        }
    }
}

extension Collection where Iterator.Element: ObservableType, Iterator.Element.E: BooleanType {
    
    func combineLatestAnd() -> Observable<Bool> {
        return Observable.combineLatest(self) { bools -> Bool in
            return bools.reduce(true, { (memo, element) in
                return memo && element.boolValue
            })
        }
    }
    
    func combineLatestOr() -> Observable<Bool> {
        return Observable.combineLatest(self) { bools in
            bools.reduce(false, { (memo, element) in
                return memo || element.boolValue
            })
        }
    }
}
