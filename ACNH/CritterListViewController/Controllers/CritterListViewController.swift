import UIKit
import Rswift

class CritterListViewController: UIViewController {

    @IBOutlet var segmentController: UISegmentedControl!
    @IBOutlet var tableView: UITableView!

    var presenter: CritterListPresenter!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"

        title = formatter.string(from: date)

        segmentController.addTarget(self, action: #selector(selectDifferentSection), for: .valueChanged)

        tableView.dataSource = presenter
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CritterListCell.self), bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.critterListCell.identifier)
    }

    @objc func selectDifferentSection() {
        tableView.reloadData()
    }

    
}

extension CritterListViewController: CritterListType {
    var critterSection: Int {
        return segmentController.selectedSegmentIndex
    }
}

extension CritterListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var critter : Critter {
            switch segmentController.selectedSegmentIndex {
            case 0:
                return presenter.bugs[indexPath.row]
            case 1:
                return presenter.fish[indexPath.row]
            case 2:
                return presenter.sea[indexPath.row]
            default:
                return presenter.bugs[indexPath.row]
            }
        }
        let detailsVC = CritterDetailViewController(type: critter.type, critter: critter)
        navigationController?.pushViewController(detailsVC, animated: false)
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
