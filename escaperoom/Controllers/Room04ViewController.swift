//
//  Room04ViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 24/07/21.
//

import Foundation
import UIKit

class Room04ViewController: UIViewController {
    @IBOutlet weak var lockedDoorInfo: UITextView!
    @IBOutlet weak var liveDoor: UIImageView!
    @IBOutlet weak var dieDoor: UIImageView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var mapItem: UIButton!
    @IBOutlet weak var evacuationMap: UIImageView!
    @IBOutlet weak var dieDoorBig: UIImageView!
    @IBOutlet weak var liveDoorBig: UIImageView!
    var actualDoor: DoorType?
    let nextSceneName: String = "Room05ViewController"
    let dieSceneName: String = "DieViewController"
    let rightDoor: DoorType = .die
    var hasMap: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ShowMapItem()
        AudioController.stopAudio()
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
            
            self.PlaySounds()
            
            self.showOnlyDoor()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                if self.actualDoor == self.rightDoor {
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: self.nextSceneName) as! Room05ViewController
                    newViewController.hasMap = self.hasMap
                    self.present(newViewController, animated: false, completion: nil)
                }
                else {
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: self.dieSceneName)
                    self.present(newViewController, animated: false, completion: nil)
                }
            }
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
    
    func showOnlyDoor() {
        switch self.actualDoor {
        case .die:
            self.dieDoorBig.alpha = 1
        case .live:
            self.liveDoorBig.alpha = 1
        default:
            print("")
        }
    }
    
    func PlaySounds() {
        AudioController.stopAudio()
        AudioController.playAudio(name: "door")
    }
}
