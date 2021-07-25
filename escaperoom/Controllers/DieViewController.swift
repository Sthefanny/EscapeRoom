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
        
        AudioController.stopAudio()
        AudioController.playAudio(name: "laser")
    }
}
