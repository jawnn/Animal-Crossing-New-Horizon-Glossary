import UIKit

class CritterDetailCell: UITableViewCell {

    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
        contentView.layer.cornerRadius = 10
        cellBackgroundView.layer.cornerRadius = 10
        cellBackgroundView.clipsToBounds = true
        titleLabel.layer.cornerRadius = 10
        titleLabel.layer.masksToBounds = true
        descriptionLabel.layer.cornerRadius = 10
        descriptionLabel.layer.masksToBounds = true
    }

    func configureLabelText(title: String?, description: String) {
        titleLabel.text = title ?? "Unknown"
        descriptionLabel.text = description
    }

}
