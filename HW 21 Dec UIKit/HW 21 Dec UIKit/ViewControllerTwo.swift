//
//  ViewControllerTwo.swift
//  HW 21 Dec UIKit
//
//  Created by Артем Чжен on 22/12/22.
//

import UIKit

class ViewControllerTwo: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Info \(selectedName!.replacingOccurrences(of: ".png", with: ""))"
        
        if let imageLoad = selectedName {
            imageView.image = UIImage(named: imageLoad)
        }

    }
 
}
