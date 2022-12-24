//
//  ViewController.swift
//  HW 21 Dec UIKit
//
//  Created by Артем Чжен on 22/12/22.
//

import UIKit



class ViewController: UITableViewController {
    var nameUIKit = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("UI") {
                nameUIKit.append(item)
            }
        }
        print(nameUIKit)
        nameUIKit.sort()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameUIKit.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Name", for: indexPath)
        cell.textLabel?.text = nameUIKit[indexPath.row].replacingOccurrences(of: ".png", with: "")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Two") as? ViewControllerTwo {
            vc.selectedName = nameUIKit[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
