//
//  MainVC.swift
//  RandomCatGeneratorSwift
//
//  Main page of App
//  View part of VIPER

import UIKit


class MainVC: UIViewController {
    
    let manager: NetworkManagerProtocol = NetworkManger()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        updateImage()
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
    
    
    @IBAction func generateNewCatButtonTapped(_ sender: Any) {
        
    }
}


extension MainVC {
    func updateImage() {
        manager.fetchCat { result in
            switch result {
                
            case let .success(response):
                
                print(response._id)
               
            case let .failure(error):
                print(error)
            }
        }
    }
}
