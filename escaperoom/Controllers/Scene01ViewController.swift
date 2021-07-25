//
//  ViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 21/07/21.
//

import UIKit

class Scene01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioController.stopAudio()
        AudioController.playAudio(name: "city")
    }
    

}

