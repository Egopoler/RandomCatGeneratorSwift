import UIKit



final class CatTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var catImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func setUpData(_ data: nil) {
//        self.characterName.text = data.name
//    }
    func setUpData(_ catData: CatGallery) {
        //self.characterName.text = data.name
        let img = Interactor.shared.downloadImage(from: catData.image ?? "") { image in
            guard let img = image else {
                print("Failed to download image")
                return
            }

            print(img == nil)
            self.catImage.image = img
            print("image was set")
            
        }
    }
    
}
