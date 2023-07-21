//
//  GalleryVC.swift
//  RandomCatGeneratorSwift
//
//  Additional page of App with gallery
//  View part of VIPER

import UIKit
import CoreData

class GalleryVC: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    let userInteractiveQueue = DispatchQueue.main
    
    lazy var frc: NSFetchedResultsController<CatGallery> = {
        let request = CatGallery.fetchRequest()
        request.sortDescriptors = []
        let frc = NSFetchedResultsController(fetchRequest: request,
            managedObjectContext: PersistentContainer.shared.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        //frc.delegate = self
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //Interactor.shared.deleteAllCats()
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
extension GalleryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let catCell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell") as? CatTableViewCell
        else { return UITableViewCell() }
        return catCell
    }
    
    
}
