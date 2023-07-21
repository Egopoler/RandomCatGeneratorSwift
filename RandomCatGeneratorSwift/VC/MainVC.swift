//
//  MainVC.swift
//  RandomCatGeneratorSwift
//
//  Main page of App
//  View part of VIPER

import UIKit


class MainVC: UIViewController {
    
    
    @IBOutlet weak var catImageView: UIImageView!
    
    let manager: NetworkManagerProtocol = NetworkManger()
    
    var currentCat: CatResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        updateImage()
        //self.catImageView.image = Interactor.shared.downloadAnonymousImage()
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
        updateImage()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard var cat_id: String = self.currentCat?._id else {return}
        print("try to add this cat in model: \(cat_id)")
        Interactor.shared.addInModel(from: cat_id)
        
        
    }
    
    
}


extension MainVC {
    func updateImage() {
        manager.fetchCat { result in
            switch result {
                
            case let .success(response):
                print(12)
                let url = BASE_URL + "/cat/" + response._id
                print(url)
                self.currentCat = response
                
                let img = Interactor.shared.downloadImage(from: url) { image in
                    guard let img = image else {
                        print("Failed to download image")
                        return
                    }

                    print(img == nil)
                    self.catImageView.image = img
                    print("image was set")
                    
                }
                
                
                
            case let .failure(error):
                print(13)
                print(error)
                self.currentCat = nil
                self.catImageView.image = Interactor.shared.downloadAnonymousImage()
            }
        }
    }
}
