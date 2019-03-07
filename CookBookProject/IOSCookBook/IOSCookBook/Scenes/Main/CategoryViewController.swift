//
//  CategoryViewController.swift

import UIKit
import Foundation

class CategoryViewController: UIViewController, BindableType {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CategoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        title = Constant.title
        tableView.do {
            $0.register(cellType: CategoryCell.self)
            $0.rowHeight = Constant.rowHeight
        }
    }
    
    func bindViewModel() {
        let input = CategoryViewModel.Input(
            loadTrigger: Driver.just(()),
            selectTrigger: tableView.rx.itemSelected.asDriver()
        )
        let output = viewModel.transform(input)
        
        output.categories
            .drive(tableView.rx.items) { tableView, index, category in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: CategoryCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContentForCell(category)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.selected
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.indicator
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
        
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
    }
    
    private struct Constant {
        static let rowHeight: CGFloat = 56
        static let title = "Category"
    }
}

extension CategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
