//
//  ViewController.swift
//  JointDev
//
//  Created by HirotoUeda on R 3/11/05.
//

import UIKit

final class MainViewController: UIViewController {
    typealias ViewModel = MainViewModel
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            MainTableViewCell.registerTableView(tableView: tableView)
        }
    }
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sections = viewModel.sections else { return }
        switch sections[indexPath.row] {
        
        case .ueda(star:_):
            let vc: TempViewController = .instantiate()
            present(vc)
        case .ryouma:
            // 遷移メソッドをかく
            let vc: RyomaViewController = .instantiate()
            present(vc)
            break
        case .masaki:
            // 遷移メソッドをかく
            break
        case .kame:
            // 遷移メソッドをかく
            break
        case .katoshin:
            // 遷移メソッドをかく
            break
        case .keke:
            // 遷移メソッドをかく
            let vc: KekeViewController = .instantiate()
            present(vc)
            break
        case .kei:
            // 遷移メソッドをかく
            break
        }
     }
}

// MARK: UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    /// TableViewに表示する個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.sections?.count else { return 0 }
        return count
    }
    
    /// TableViewに表示するItemの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        guard let sections = viewModel.sections else { return UITableViewCell() }
        cell.titleLabel.text = sections[indexPath.row].title
        return cell
    }
}

// MARK: Private

extension MainViewController {
    private func present(_ vc: UIViewController) {
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}
