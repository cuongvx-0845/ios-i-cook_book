//
//  CategoryDetailViewController.swift

import UIKit
import Foundation

class CategoryDetailViewController: UIViewController, BindableType {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
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
            .drive(avatarBinding)
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

extension CategoryDetailViewController {
    
    var avatarBinding: Binder<String> {
        return Binder(self) { viewController, imageUrl in
            let url = URL(string: imageUrl)
            viewController.avatarImageView.sd_setImage(with: url, completed: nil)
        }
    }
}

extension CategoryDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
