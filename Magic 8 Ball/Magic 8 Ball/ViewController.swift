//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by ホアンゴックシン on 2018/08/06.
//  Copyright © 2018 vnguider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomIndex: Int = 0
    let imageArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateBallImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        updateBallImages()
    }
    
    func updateBallImages() {
        randomIndex = Int(arc4random_uniform(5))
        ballImageView.image = UIImage(named: imageArray[randomIndex])
    }
}

