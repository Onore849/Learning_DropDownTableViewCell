//
//  ViewController.swift
//  expandTableViewCell
//
//  Created by 野澤拓己 on 2020/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    private var data = [
        DataModel(number: 1, headerName: "筋トレ", subTypes: ["Pants", "T-shirts", "Jeans"], isExpandable: false),
        DataModel(number: 2, headerName: "瞑想", subTypes: ["Pants", "T-shirts", "Jeans", "CropTop"], isExpandable: false),
        DataModel(number: 3, headerName: "読書", subTypes: ["Pants", "T-shirts", "Jeans"], isExpandable: false),
    ]
    
    private let tableView: UITableView = {
       
        let tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .darkGray
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(
                                        x: 10,
                                        y: 10,
                                        width: tableView.frame.size.width - 20,
                                        height: 50)
        )
        
        headerView.delegate = self
        headerView.secIndex = section
        
        guard let number = data[section].number, let headerName = data[section].headerName else {
            return nil
        }
        
        headerView.button.setTitle("\(number): \(headerName)", for: .normal)
        
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isExpandable {
            return data[section].subTypes!.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data[indexPath.section].isExpandable {
            return 40
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section].subTypes?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension ViewController: HeaderDelegate {
    func cellHeader(idx: Int) {
        data[idx].isExpandable = !data[idx].isExpandable
        tableView.reloadSections([idx], with: .automatic)
    }
    
    
}
