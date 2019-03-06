//
//  CategoryCell.swift

import UIKit

final class CategoryCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContentForCell(_ category: Category) {
        nameLabel.text = category.name
    }
}
