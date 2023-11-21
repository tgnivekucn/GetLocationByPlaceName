//
//  ViewController.swift
//  GetLocationByPlaceName
//
//  Created by SomnicsAndrew on 2023/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PlaceToLocationManager.shared.getLocation(by: "taipei arena")
    }


}

