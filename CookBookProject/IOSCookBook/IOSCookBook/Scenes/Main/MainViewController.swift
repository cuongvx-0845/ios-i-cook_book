//
//  MainViewController.swift

import UIKit
import Foundation
import MGArchitecture

class MainViewController: UIViewController, BindableType {
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        let input = MainViewModel.Input(
            loadTrigger: Driver.just(()),
            selectTrigger: tableView.rx.itemSelected.asDriver()
        )
        let output = viewModel.transform(input)
        
        output.repos.asObservable()
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
