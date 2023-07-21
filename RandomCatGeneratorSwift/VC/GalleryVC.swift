//
//  GalleryVC.swift
//  RandomCatGeneratorSwift
//
//  Additional page of App with gallery
//  View part of VIPER

import UIKit
import CoreData

class GalleryVC: UIViewController, NSFetchedResultsControllerDelegate {
    

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
        frc.delegate = self
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        do{
            try frc.performFetch()
        }catch{
            print(error.localizedDescription)
        }

    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("MyGalleryController has been initialized")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? CatDetailVC {
            destVC.cat = sender as? CatGallery
        }
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
        if let sections = frc.sections{
            return sections[section].numberOfObjects
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let catCell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell") as? CatTableViewCell
        else { return UITableViewCell() }
        catCell.setUpData(frc.object(at: indexPath))
        
        
        
        return catCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat: CatGallery = frc.object(at: indexPath)
        performSegue(withIdentifier: "ToCatDetailVC", sender: cat)
    }
    
    
}
