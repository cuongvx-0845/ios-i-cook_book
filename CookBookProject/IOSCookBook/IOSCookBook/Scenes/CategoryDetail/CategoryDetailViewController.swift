
//  CategoryDetailViewController.swift

import UIKit
import Foundation

final class CategoryDetailViewController: UIViewController, BindableType {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var viewModel: CategoryDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        title = "Category Detail"
    }
    
    func bindViewModel() {
        let input = CategoryDetailViewModel.Input(
            loadTrigger: Driver.just(())
        )
        let output = viewModel.transform(input)

        output.categoryImage
            .drive(avatarImageView.rx.avatarBinding)
            .disposed(by: rx.disposeBag)
        
        output.categoryName
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

extension CategoryDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
