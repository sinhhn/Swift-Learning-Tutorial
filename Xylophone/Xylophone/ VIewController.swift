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
    let audioFiles = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        playSound(audioFiles[sender.tag - 1], "wav")
    }

    func playSound(_ fileName: String, _ extention: String) {
        let soundUrl = Bundle.main.url(forResource: fileName, withExtension: extention)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }

}
