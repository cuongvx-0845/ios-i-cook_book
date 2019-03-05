//
//  CategoryRepoCell.swift

import UIKit

final class CategoryRepoCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContentForCell(_ categoryRepo: CategoryRepo) {
        nameLabel.text = categoryRepo.categoryName
    }
}
