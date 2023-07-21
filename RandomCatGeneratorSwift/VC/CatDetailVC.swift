//
//  CatDetailVC.swift
//  RandomCatGeneratorSwift
//
//  Created by MacBook Pro on 22.07.2023.
//

import UIKit

class CatDetailVC: UIViewController {
    
    var cat: CatGallery?
    
    @IBOutlet weak var catBigImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData(cat!)
        // Do any additional setup after loading the view.
    }
    
    func setUpData(_ catData: CatGallery) {
        
        let img = Interactor.shared.downloadImage(from: catData.image!) { image in
            guard let img = image else {
                print("Failed to download image")
                return
            }

            self.catBigImage.image = img
        }
    }
    
    
    @IBAction func catDeleteButtonTapped(_ sender: Any) {
        Interactor.shared.deleteCat(cat?.id)
        navigationController?.popViewController(animated: true)
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
