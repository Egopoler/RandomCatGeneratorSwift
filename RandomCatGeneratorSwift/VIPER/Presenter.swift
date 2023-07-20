//
//  Presenter.swift
//  RandomCatGeneratorSwift
//
//  Created by MacBook Pro on 20.07.2023.
//

import Foundation

enum FatchError: Error{
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var viewController: AnyViewController? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    
    
}


class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    
    var viewController: AnyViewController?
    
   
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            viewController?.update(with: users)
        case .failure:
            viewController?.update(with: "error")
        }
    }
}
