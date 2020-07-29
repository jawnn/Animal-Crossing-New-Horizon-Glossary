import Kingfisher
import UIKit

class CritterDetailViewController: UIViewController {

    @IBOutlet var critterImage: UIImageView!
    @IBOutlet var tableView: UITableView!

    var presenter: CritterDetailPresenterType!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: presenter.imageURLString) {
            critterImage.kf.setImage(with: url)
        }

        title = presenter.critterName.capitalized

        tableView.dataSource = presenter
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CritterDetailCell.self), bundle: nil), forCellReuseIdentifier: "detailCellID")

    }

}

extension CritterDetailViewController: CritterDetailType {
    
}

extension CritterDetailViewController: UITableViewDelegate {

}
