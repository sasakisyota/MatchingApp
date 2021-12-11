//
//  RegisterViewModel.swift
//  MatchingApp
//
//  Created by 佐々木翔太 on 2021/12/08.
//

import Foundation
import RxSwift
import RxCocoa

protocol RegisterViewModelInputs {
    var nameTextInput: AnyObserver<String> { get }
    var emailTextInput: AnyObserver<String> { get }
    var passwordTextInput: AnyObserver<String> { get }
}

protocol RegisterViewModelOutputs {
    var nameTextOutput: AnyObserver<String> { get }
    var emailTextOutput: AnyObserver<String> { get }
    var passwordTextOutput: AnyObserver<String> { get }
}

class RegisterViewModel {
    
    private let disposeBag = DisposeBag()
    
    // MARK: observable
    var nameTextOutput = PublishSubject<String>()
    var emailTextOutput = PublishSubject<String>()
    var passwordTextOutput = PublishSubject<String>()
    var vaildRegisterSubject = BehaviorSubject<Bool>(value: false)
    
    // MARK: observer
    var nameTextInput: AnyObserver<String> {
        nameTextOutput.asObserver()
    }
    
    var emailTextInput: AnyObserver<String> {
        emailTextOutput.asObserver()
    }
    
    var passwordTextInput: AnyObserver<String> {
        passwordTextOutput.asObserver()
    }
    
    var vaildRegisterDriver: Driver<Bool> = Driver.never()
    
    init() {
        
       vaildRegisterDriver = vaildRegisterSubject
            .asDriver(onErrorDriveWith: Driver.empty())
        
       let nameValid = nameTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }
        
       let emailValid = emailTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }

        
        let passwordValid = passwordTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }

        Observable.combineLatest(nameValid, emailValid, passwordValid) { $0 && $1 && $2 }
        .subscribe { validAll in
            self.vaildRegisterSubject.onNext(validAll)
        }
        .disposed(by: disposeBag)

    }
    
}
