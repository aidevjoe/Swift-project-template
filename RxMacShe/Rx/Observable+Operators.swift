import Foundation
import RxSwift
import RxCocoa

extension Observable {
    
    /**
     Invokes an action for each Next event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    public func doOnNext(_ onNext: @escaping (E) throws -> Void) -> Observable<E> {
        return self.do(onNext: onNext)
    }
    
    /**
     Invokes an action for the Error event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    public func doOnError(_ onError: @escaping (Swift.Error) throws -> Void) -> Observable<E> {
        return self.do(onError: onError)
    }
    
    /**
     Invokes an action for the Completed event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    public func doOnCompleted(_ onCompleted: @escaping () throws -> Void) -> Observable<E> {
        return self.do(onCompleted: onCompleted)
    }
    
    /**
     Subscribes an element handler to an observable sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    public func subscribeNext(_ onNext: @escaping (E) -> Void) -> Disposable {
        return self.subscribe(onNext: onNext)
    }
    
    /**
     Subscribes an error handler to an observable sequence.
     
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    public func subscribeError(_ onError: @escaping (Swift.Error) -> Void) -> Disposable {
        return self.subscribe(onError: onError)
    }
    
    /**
     Subscribes a completion handler to an observable sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    public func subscribeCompleted(_ onCompleted: @escaping () -> Void) -> Disposable {
        return self.subscribe(onCompleted: onCompleted)
    }
}


public extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    
    /**
     Invokes an action for each Next event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    public func doOnNext(_ onNext: @escaping (E) -> Void) -> Driver<E> {
        return self.do(onNext: onNext)
    }
    
    /**
     Invokes an action for the Completed event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    public func doOnCompleted(_ onCompleted: @escaping () -> Void) -> Driver<E> {
        return self.do(onCompleted: onCompleted)
    }
    
    /**
     Subscribes an element handler to an observable sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    public func driveNext(_ onNext: @escaping (E) -> Void) -> Disposable {
        return self.drive(onNext: onNext)
    }
    
    /**
     Subscribes a completion handler to an observable sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    public func driveCompleted(_ onCompleted: @escaping () -> Void) -> Disposable {
        return self.drive(onCompleted: onCompleted)
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
