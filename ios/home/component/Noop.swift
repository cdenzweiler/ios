//
//  Noop.swift
//  ios
//
//  Created by S. Matthew English on 5/12/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import UIKit

class Noop: UIViewController {
    
    @IBOutlet weak var buttonAccept: UIButton!
    
    
    private var transitionHelp = TransHelp()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        modalPresentationStyle = .custom
        modalTransitionStyle = .crossDissolve
        transitioningDelegate = transitionHelp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClickAccept(_ sender: Any) {
        DispatchQueue.main.async {
            
            self.presentingViewController!.dismiss(animated: false, completion: nil)
        }
    }
    
}
