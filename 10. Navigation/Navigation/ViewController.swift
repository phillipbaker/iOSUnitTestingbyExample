//
//  ViewController.swift
//  Navigation
//
//  Created by Phillip Baker on 5/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var codePushButton: UIButton!
    @IBOutlet private(set) var codeModalButton: UIButton!
    @IBOutlet private(set) var seguePushButton: UIButton!
    @IBOutlet private(set) var segueModalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func pushNextViewController() {
        let nextVC = CodeNextViewController(labelText: "Pushed from code")
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction private func presentModalNextViewController() {
        let nextVC = CodeNextViewController(labelText: "Modal from code")
        self.present(nextVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? SegueNextViewController else { return }
        switch segue.identifier {
        case "pushNext":
            nextVC.labelText = "Pushed from segue"
        case "modalNext":
            nextVC.labelText = "Modal from segue"
        default:
            return
        }
    }
    
    deinit {
        print("ViewController.deinit")
    }
}

