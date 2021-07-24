//
//  DieViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 24/07/21.
//

import Foundation
import UIKit

class DieViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetGame()
    }
    
    func resetGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
            self.present(newViewController, animated: false, completion: nil)
        }
    }
}
