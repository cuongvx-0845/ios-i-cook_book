//
//  MealDetailViewController.swift

import UIKit
import Foundation

final class MealDetailViewController: UIViewController, BindableType {
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    var viewModel: MealDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        title = "Meal Detail"
    }
}

extension MealDetailViewController {
    func bindViewModel() {
        let input = MealDetailViewModel.Input(
            loadTrigger: Driver.just(())
        )
        let output = viewModel.transform(input)
        
        output.mealImage
            .drive(avatarImageView.rx.avatarBinding)
            .disposed(by: rx.disposeBag)
        
        output.mealName
            .drive(nameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        output.indicator
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
        
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
    }
}
