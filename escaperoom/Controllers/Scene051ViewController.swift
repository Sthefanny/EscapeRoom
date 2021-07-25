//
//  Scene05-1ViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 25/07/21.
//

import UIKit

class Scene051ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioController.stopAudio()
        AudioController.playAudio(name: "screen")
    }

}
