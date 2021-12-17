//
//  GyudonPriceTableViewController.swift
//
//
//  Created by 亀田聖翔 on 2021/12/10.
//

import UIKit
//HTTP通信してくれるやつ
import Alamofire
//スクレイピングしてくれるやつ
import Kanna

class CameTableViewController: UIViewController {
    var beefbowl = [Gyudon]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getGyudonPrice()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    func getGyudonPrice() {
    //スクレイピング対象のサイトを指定
        AF.request("https://www.yoshinoya.com/menu/gyudon/gyu-don/").responseString { response in
            switch response.result {
            case let .success(value):
                if let doc = try? HTML(html: value, encoding: .utf8) {
                    
                    // 牛丼のサイズをXpathで指定
                    var sizes = [String]()
                    for link in doc.xpath("//th[@class='menu-size']") {
                        sizes.append(link.text ?? "")
                    }
                    
                    //牛丼の値段をXpathで指定
                    var prices = [String]()
                    for link in doc.xpath("//td[@class='menu-price']") {
                        prices.append(link.text ?? "")
                    }
                    
                    //牛丼のサイズ分だけループ
                    for (index, value) in sizes.enumerated() {
                        let gyudon = Gyudon()
                        gyudon.size = value
                        gyudon.price = prices[index]
                        self.beefbowl.append(gyudon)
                    }
//                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

extension CameTableViewController: UITableViewDelegate {

}

extension CameTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beefbowl.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let gyudon = self.beefbowl[indexPath.row]
        cell.textLabel?.text = gyudon.size
        cell.detailTextLabel?.text = gyudon.price
        return cell
    }
}

// MARK: Constructor

extension CameTableViewController {
    static func instantiate() -> Self {
        let vc: CameTableViewController = .loadFromStoryboard()
        return vc as! Self
    }
}

class Gyudon: NSObject {
    var size: String = ""
    var price: String = ""
}
