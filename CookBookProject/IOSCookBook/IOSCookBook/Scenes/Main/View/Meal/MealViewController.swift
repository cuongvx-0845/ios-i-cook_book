//
//  MealViewController.swift

import UIKit
import Foundation

final class MealViewController: UIViewController, BindableType {
    
    private struct Constant {
        static let rowHeight: CGFloat = 232
        static let title = "Home"
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: MealViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        let headerView = HeaderTableViewCell()
        
        title = Constant.title
        tableView.do {
            $0.register(cellType: MealCell.self)
            $0.rowHeight = Constant.rowHeight
            $0.tableHeaderView = headerView
        }
        configHeaderTableView()
    }
    
    private func configHeaderTableView() {
        let nibNameBody = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        tableView.register(nibNameBody, forCellReuseIdentifier: "HeaderTableViewCell")
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else {
            return
        }
        tableView.tableHeaderView = headerCell
    }
}

extension MealViewController {
    func bindViewModel() {
        let input = MealViewModel.Input(
            loadTrigger: Driver.just(()),
            selectTrigger: tableView.rx.itemSelected.asDriver()
        )
        let output = viewModel.transform(input)
        
        output.meals
            .drive(tableView.rx.items) { tableView, index, meal in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: MealCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContentForCell(meal)
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
}

extension MealViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
