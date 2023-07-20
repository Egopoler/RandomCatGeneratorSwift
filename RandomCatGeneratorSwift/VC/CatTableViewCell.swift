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
    
    
}
