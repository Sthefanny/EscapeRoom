//
//  ElevatorViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 24/07/21.
//

import Foundation
import UIKit

class ElevatorViewController: UIViewController {
    @IBOutlet weak var confirmationMessage: UITextView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    var hasMap: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ShowConfirmMessage(_ sender: Any) {
        self.confirmationMessage.alpha = 1
        self.yesButton.alpha = 1
        self.noButton.alpha = 1
    }
    
    @IBAction func YesButtonAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Room01ViewController") as! Room01ViewController
        newViewController.hasMap = self.hasMap
        self.present(newViewController, animated: false, completion: nil)
    }
    
    @IBAction func NoButtonAction(_ sender: Any) {
        ClearAll()
    }
    
    func ClearAll() {
        self.confirmationMessage.alpha = 0
        self.yesButton.alpha = 0
        self.noButton.alpha = 0
    }
}
