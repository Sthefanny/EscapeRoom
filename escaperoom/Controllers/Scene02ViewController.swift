//
//  Scene02ViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 25/07/21.
//

import UIKit

class Scene02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioController.stopAudio()
        AudioController.playAudio(name: "shower water")
    }
    

}

