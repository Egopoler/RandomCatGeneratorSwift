import UIKit



final class CatTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var catImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

    func setUpData(_ catData: CatGallery) {
        let img = Interactor.shared.downloadImage(from: catData.image ?? "") { image in
            guard let img = image else {
                print("Failed to download image")
                return
            }

            print(img == nil)
            self.catImage.image = img
            
        }
    }
    
}
