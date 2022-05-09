//
//  NewOrderVC.swift
//  Order
//
//  Created by thond02 on 09/05/2022.
//

import UIKit

class NewOrderVC: UIViewController {
    
    var orders: [Order] = [Order(id: Int(Date().timeIntervalSince1970), state: .new, dishes: [
        Dishes(id: "1", name: "C1", detail: "C1 detail", media: [], cost: 100, isDelivered: false),
        Dishes(id: "2", name: "C2", detail: "C2 detail", media: [], cost: 200, isDelivered: false),
        Dishes(id: "3", name: "C3", detail: "C3 detail", media: [], cost: 300, isDelivered: false),
        Dishes(id: "4", name: "C4", detail: "C4 detail", media: [], cost: 250, isDelivered: false)
    ], tables: [1]),
                           Order(id: Int(Date().timeIntervalSince1970) + 10, state: .new, dishes: [
                            Dishes(id: "1", name: "C1", detail: "C1 detail", media: [], cost: 100, isDelivered: false),
                            Dishes(id: "4", name: "C4", detail: "C4 detail", media: [], cost: 250, isDelivered: false)
                           ], tables: [2]),
                           Order(id: Int(Date().timeIntervalSince1970) + 20, state: .new, dishes: [
                            Dishes(id: "3", name: "C3", detail: "C3 detail", media: [], cost: 300, isDelivered: false),
                            Dishes(id: "4", name: "C4", detail: "C4 detail", media: [], cost: 250, isDelivered: false)
                           ], tables: [10])]
    
    lazy var tableView: UITableView = {
       let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.allowsMultipleSelection = false
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
        tableView.register(UINib(nibName: OrderCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: OrderCell.reuseIdentifier)

    }
}

extension NewOrderVC: UITableViewDelegate {
    
}

extension NewOrderVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders[section].dishes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseIdentifier) as? OrderCell
        if cell == nil {
            cell = OrderCell(style: .default, reuseIdentifier: OrderCell.reuseIdentifier)
        }
        cell?.setDish(orders[indexPath.section].dishes[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
