import UIKit
import Kingfisher

class CritterListCell: UITableViewCell {

    @IBOutlet var critterID: UILabel!
    @IBOutlet var critterIcon: UIImageView!
    @IBOutlet var critterName: UILabel!
    @IBOutlet var cellColorBackground: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
        cellColorBackground.layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10
        critterID.layer.cornerRadius = 8
        critterID.layer.masksToBounds = true
        critterName.layer.cornerRadius = 10
        critterName.layer.masksToBounds = true
    }

    override func prepareForReuse() {
        critterName.text = ""
        critterID.text = ""
        critterIcon.image = UIImage(resource: R.image.load_spinner)
    }

    func configure(critter: Critter) {
        guard let iconUrl = URL(string: critter.iconUrl), let name = critter.name?.name else {
            return
        }

        critterIcon.kf.setImage(with: iconUrl)
        critterID.text = "\(critter.id)"
        critterName.text = name.capitalized
    }

}
