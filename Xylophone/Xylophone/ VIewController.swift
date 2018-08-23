//
//  ViewController.swift
//  Xylophone
//
//  Created by SinhHN on 21/08/2018.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    typealias SoundFile = (fileName: String, extension: String)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        let soundFile: SoundFile = getSound(sender)
        
        let soundUrl = Bundle.main.url(forResource: soundFile.fileName, withExtension: soundFile.extension)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    
    func getSound(_ sender: UIButton) -> SoundFile {
        let type = "wav"
        switch sender.tag {
        case 1:
            return ("note1", type)
        case 2:
            return ("note2", type)
        case 3:
            return ("note3", type)
        case 4:
            return ("note4", type)
        case 5:
            return ("note5", type)
        case 6:
            return ("note6", type)
        default:
            return ("", "")
        }
    }
    
}

