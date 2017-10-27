//
//  ViewController.swift
//  ThemingExample
//
//  Created by Gerardo Garrido Grande on 12/3/17.
//  Copyright © 2017 GGG. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel = MainViewModel();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Actions
    
    @IBAction func onButtonTap(_ sender: Any) {
        self.viewModel.toggleTheme();
    }
}

