//
//  Router.swift
//  RandomCatGeneratorSwift
//
//  Created by MacBook Pro on 20.07.2023.
//

import Foundation
import UIKit

typealias EntryPoint = AnyViewController & UIViewController


protocol AnyRouter {
    var root: UIViewController? {get}
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    var root: UIViewController?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // here create VIP
        print("router-start")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        print(2)
        var rootview = storyboard.instantiateViewController(withIdentifier: "indNavigationController") as? UIViewController
        var view = storyboard.instantiateViewController(withIdentifier: "indMainVC") as? EntryPoint
//        var viewGallery = storyboard.instantiateViewController(withIdentifier: "indGalleryVC") as? EntryPoint
        print("router-checkpoint")
        // var view: AnyViewController = ViewController()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
        
        view?.presenter = presenter
        
        interactor.presenter = presenter
        
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = view
        
        router.entry = view as? EntryPoint
        router.root = rootview as? UIViewController
        
        
        
        return router
    }
}
