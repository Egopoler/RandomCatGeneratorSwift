//
//  GalleryVC.swift
//  RandomCatGeneratorSwift
//
//  Additional page of App with gallery
//  View part of VIPER

import UIKit

class GalleryVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // ViewController.myStoryboard = storyboard
        print("MyGalleryController has been initialized")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
