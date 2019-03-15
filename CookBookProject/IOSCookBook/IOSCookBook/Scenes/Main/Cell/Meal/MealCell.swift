//
//  MealCell.swift

import UIKit

final class MealCell: UITableViewCell, NibReusable {
    //  MARK: - UI Element
    @IBOutlet weak private var mealImageView: UIImageView!
    @IBOutlet weak private var categoryNameLabel: UILabel!
    @IBOutlet weak private var mealNameLabel: UILabel!
    
    func setContentForCell(_ meal: Meal) {
        let url = URL(string: meal.avatarURLString)
        mealImageView.sd_setImage(with: url, completed: nil)
        categoryNameLabel.text = meal.ofCategory
        mealNameLabel.text = meal.name
    }
}
