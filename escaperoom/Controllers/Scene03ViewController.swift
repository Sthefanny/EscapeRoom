//
//  Scene03ViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 25/07/21.
//

import UIKit

class Scene03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioController.stopAudio()
        AudioController.playAudio(name: "toilet flush")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        AudioController.stopAudio()
    }

}
