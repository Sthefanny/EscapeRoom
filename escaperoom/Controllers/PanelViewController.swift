//
//  PanelViewController.swift
//  escaperoom
//
//  Created by Sthefanny Gonzaga on 25/07/21.
//

import Foundation
import UIKit

class PanelViewController: UIViewController {
    @IBOutlet weak var gameRulesButton: UIButton!
    @IBOutlet weak var evacuationMapButton: UIButton!
    @IBOutlet weak var buildingRulesButton: UIButton!
    @IBOutlet weak var message01Button: UIButton!
    @IBOutlet weak var message02Button: UIButton!
    @IBOutlet weak var gameRules: UITextView!
    @IBOutlet weak var evacuationMap: UIImageView!
    @IBOutlet weak var buildingRules: UITextView!
    @IBOutlet weak var message01: UITextView!
    @IBOutlet weak var message02: UITextView!
    @IBOutlet weak var dontTakeMessage: UITextView!
    @IBOutlet weak var takeMessage: UITextView!
    @IBOutlet weak var takeButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    var actualPaper: PaperType?
    var mapTaken = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioController.stopAudio()
    }
    
    @IBAction func ShowGameRules(_ sender: Any) {
        self.actualPaper = .gameRules
        self.gameRules.alpha = 1
        self.takeButton.alpha = 1
        self.leftButton.alpha = 1
    }
    
    @IBAction func ShowEvacuationMap(_ sender: Any) {
        self.actualPaper = .evacuationMap
        self.evacuationMap.alpha = 1
        self.takeButton.alpha = 1
        self.leftButton.alpha = 1
    }
    
    @IBAction func ShowBuildingRules(_ sender: Any) {
        self.actualPaper = .buildingRules
        self.buildingRules.alpha = 1
        self.takeButton.alpha = 1
        self.leftButton.alpha = 1
    }
    
    @IBAction func ShowMessage01(_ sender: Any) {
        self.actualPaper = .message01
        self.message01.alpha = 1
        self.takeButton.alpha = 1
        self.leftButton.alpha = 1
    }
    
    @IBAction func ShowMessage02(_ sender: Any) {
        self.actualPaper = .message02
        self.message02.alpha = 1
        self.takeButton.alpha = 1
        self.leftButton.alpha = 1
    }
    
    @IBAction func TakeButtonAction(_ sender: Any) {
        if self.actualPaper != nil {
            if self.actualPaper == .evacuationMap {
                PlaySounds()
                self.mapTaken = true
                self.evacuationMapButton.alpha = 0
                showTakeMessage()
            }
            else {
                showDontTakeMessage()
            }
        }
        self.ClearAll()
    }
    
    @IBAction func LeftButtonAction(_ sender: Any) {
        self.ClearAll()
    }
    
    func showTakeMessage() {
        self.takeMessage.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.takeMessage.alpha = 0
        }
    }
    
    func showDontTakeMessage() {
        self.dontTakeMessage.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dontTakeMessage.alpha = 0
        }
    }
    
    func ClearAll() {
        self.gameRules.alpha = 0
        self.evacuationMap.alpha = 0
        self.buildingRules.alpha = 0
        self.message01.alpha = 0
        self.message02.alpha = 0
        self.takeButton.alpha = 0
        self.leftButton.alpha = 0
        self.actualPaper = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "BackToCorridor"){
            let destination = segue.destination as! ElevatorViewController
            destination.hasMap = self.mapTaken
            destination.playSound = false
        }
    }
    
    func PlaySounds() {
        AudioController.stopAudio()
        AudioController.playAudio(name: "paper")
    }
}
