//
//  ViewController.swift
//  Xylophone
//
//  Created by SinhHN on 21/08/2018.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        let soundUrl = Bundle.main.url(forResource: getSound(sender), withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    
    func getSound(_ sender: UIButton) -> String {
        switch sender.tag {
        case 1:
            return "note1"
        case 2:
            return "note2"
        case 3:
            return "note3"
        case 4:
            return "note4"
        case 5:
            return "note5"
        case 6:
            return "note6"
        default:
            return ""
        }
    }

}

