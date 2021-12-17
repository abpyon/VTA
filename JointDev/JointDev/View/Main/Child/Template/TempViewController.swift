//
//  TempViewController.swift
//  JointDev
//
//  Created by HirotoUeda on R 3/11/05.
//

import UIKit

/// finalをつけると継承ができなくなる。※↓のUIViewControllerみたいな位置に使えない
final class TempViewController: UIViewController {
    // エイリアス。その後これを呼ぶ時には=前の書き方に省略できる（これ書く現場は少ないけど便利。テストにも応用が効くらしい）
    typealias ViewModel = TempViewModel
    
// outlet接続は上部に記載する
// MARK: IBOutlet

    /// Summary（変数の説明などを書いておくと、該当変数を呼ぶ際に説明欄に記載される）
    @IBOutlet private weak var tempLabel: UILabel!
    // スラッシュ2つはただのコメント。///の時の恩恵は得られないので、単なるコメントの時に書く。
    @IBOutlet private weak var tempButton: UIButton!

    // aliasに記載しているので、ここでのViewModelは、TempViewModelを意味している
    private var viewModel: ViewModel!
    
    // ライフサイクル。画面生成時くらいで呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    /// ボタン押下でtempLabel変更。（これは↓の説明なので///）
    @IBAction private func tempButtonTap(_ sender: Any) {
        changeLabel("change")
    }
}

// MARK: Constructor

extension TempViewController {
    static func instantiate() -> Self {
        let vc: TempViewController = .loadFromStoryboard()
        vc.viewModel = .init()
        return vc as! Self
    }
}

// MARK: Private

extension TempViewController {
    // 引数の前に_を付けると、関数を呼び出す際に、changeLabel(text: "##")と書かなくて良くなる
    private func changeLabel(_ text: String) {
        tempLabel.text = text
    }
    
    private func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white

        let rightItem = UIBarButtonItem(title: "✖︎", style: .done, target: self, action: #selector(rightButtonTapped(_:)))

        let label: UILabel = .init()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14.0)
        label.text = "Instructor View"
        label.frame = CGRect(x: 0, y: 0, width: 240, height: 44)
        label.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let titleItem = UIBarButtonItem(customView: label)
        navigationItem.leftBarButtonItems = [titleItem]
        navigationItem.rightBarButtonItems = [rightItem]
    }
    
    @objc private func rightButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
