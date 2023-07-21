//
//  MainVC.swift
//  RandomCatGeneratorSwift
//
//  Main page of App
//  View part of VIPER

import UIKit


class MainVC: UIViewController {
    
    
    
    
    
    
    
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
    
    
    @IBAction func generateNewCatButtonTapped(_ sender: Any) {
    }
    
    
    
    
    
    

}
