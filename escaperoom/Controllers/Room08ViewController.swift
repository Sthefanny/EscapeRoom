//
//  Room08ViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 24/07/21.
//

import Foundation
import UIKit

class Room08ViewController: UIViewController {
    @IBOutlet weak var lockedDoorInfo: UITextView!
    @IBOutlet weak var liveDoor: UIImageView!
    @IBOutlet weak var dieDoor: UIImageView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var mapItem: UIButton!
    @IBOutlet weak var evacuationMap: UIImageView!
    var actualDoor: DoorType?
    let nextSceneName: String = "EndViewController"
    let dieSceneName: String = "DieViewController"
    let rightDoor: DoorType = .die
    var hasMap: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ShowMapItem()
    }
    
    @IBAction func showLockedDoorInfo(_ sender: UIButton) {
        self.lockedDoorInfo.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.lockedDoorInfo.alpha = 0
        }
    }
    
    @IBAction func liveDoorAction(_ sender: Any) {
        self.cleanAll()
        self.actualDoor = .live
        
        self.liveDoor.alpha = 1
        self.yesButton.alpha = 1
        self.noButton.alpha = 1
    }
    
    @IBAction func dieDoorAction(_ sender: Any) {
        self.cleanAll()
        self.actualDoor = .die
        
        self.dieDoor.alpha = 1
        self.yesButton.alpha = 1
        self.noButton.alpha = 1
    }
    
    @IBAction func yesButtonAction(_ sender: Any) {
        if self.actualDoor != nil {
            let nextScene = self.actualDoor == rightDoor ? nextSceneName : dieSceneName
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: nextScene)
            self.present(newViewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func noButtonAction(_ sender: Any) {
        self.cleanAll()
    }
    
    @IBAction func ShowEvacuationMap(_ sender: Any) {
        if self.evacuationMap.alpha == 0 {
            self.evacuationMap.alpha = 1
        }
        else {
            self.evacuationMap.alpha = 0
        }
    }
    
    func ShowMapItem() {
        if self.hasMap {
            self.mapItem.alpha = 1
        }
        else {
            self.mapItem.alpha = 0
        }
    }
    
    func cleanAll() {
        self.actualDoor = nil
        self.liveDoor.alpha = 0
        self.dieDoor.alpha = 0
        self.yesButton.alpha = 0
        self.noButton.alpha = 0
    }
}
