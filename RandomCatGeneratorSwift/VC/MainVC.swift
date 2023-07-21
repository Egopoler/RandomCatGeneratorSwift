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

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("MyViewController has been initialized")
    }
    
    @IBAction func galleryButtonTapped(_ sender: UIButton) {
        print("performSegue withIdentifier ToGalleryVC")
        performSegue(withIdentifier: "ToGalleryVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? GalleryVC {
            //additional code for segue
        }
    }
    
    
    @IBAction func generateNewCatButtonTapped(_ sender: Any) {
        updateImage()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let cat_id: String = self.currentCat?._id else {return}
        Interactor.shared.addInModel(from: cat_id)
        
        
    }
    
    
}


extension MainVC {
    func updateImage() {
        manager.fetchCat { result in
            switch result {
                
            case let .success(response):
                let url = BASE_URL + "/cat/" + response._id
                print(url)
                self.currentCat = response
                
                let img = Interactor.shared.downloadImage(from: url) { image in
                    guard let img = image else {
                        print("Failed to download image")
                        return
                    }

                    self.catImageView.image = img
                    
                }
                
                
                
            case let .failure(error):
                print(13)
                print(error.localizedDescription)
                self.currentCat = nil
                self.catImageView.image = Interactor.shared.downloadAnonymousImage()
            }
        }
    }
}
