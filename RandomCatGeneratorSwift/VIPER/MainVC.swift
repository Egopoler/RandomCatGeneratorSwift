//
//  MainVC.swift
//  RandomCatGeneratorSwift
//
//  Main page of App
//  View part of VIPER

import UIKit

protocol AnyViewController {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [User])
    
    func update(with error: String)
    
    
}

class MainVC: UIViewController, AnyViewController {
    
    var presenter: AnyPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // ViewController.myStoryboard = storyboard
        print("MyViewController has been initialized")
    }
    
    @IBAction func galleryButtonTapped(_ sender: UIButton) {
        print("performSegue withIdentifier ToGalleryVC")
        performSegue(withIdentifier: "ToGalleryVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? GalleryVC {
            //destVC.character = sender as? RaMCharacter
            //destVC.delegate = self
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func update(with users: [User]) {
//        DispatchQueue.main.async {
//            self.users = users
//            self.tableView.reloadData()
//            self.tableView.isHidden = false
//        }
        
    }
    
    func update(with error: String) {
        
    }
    

}
