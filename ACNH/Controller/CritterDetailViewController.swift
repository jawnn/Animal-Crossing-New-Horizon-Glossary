
import UIKit

enum CritterDetailSections: String {
    case critterInfo = "Critter Info"
    case availibility = "Availibility"
}

class CritterDetailViewController: UIViewController {

    @IBOutlet var critterImage: UIImageView!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension CritterDetailViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
