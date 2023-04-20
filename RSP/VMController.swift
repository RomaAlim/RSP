//
//  VMController.swift
//  RSP
//
//  Created by Ramazan Kalabay on 18.02.2023.
//

import UIKit
import AVFoundation

class VMController: UIViewController {
    class CustomButton: UIButton {
        override var isHighlighted: Bool {
            didSet {
                guard let color = backgroundColor else { return }

                layer.removeAllAnimations()
                UIView.animate(withDuration: 0.4, delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                    self.backgroundColor = color.withAlphaComponent(self.isHighlighted ? 0.3 : 1)
                })
            }
        }
    }

    
    @IBOutlet weak var aibotbutton: UIButton!
    
    @IBOutlet weak var fortwobutton: UIButton!
    
    @IBOutlet weak var multiplayerbutton: UIButton!

    
    var audioPlayer = AVAudioPlayer()
    
    func assignbackground(){
            let background = UIImage(named: "back2.png")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplayerbutton.layer.cornerRadius = 10
        fortwobutton.layer.cornerRadius = 10
        aibotbutton.layer.cornerRadius = 10

        
        assignbackground()
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "mainm", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func musicc(_ sender: AnyObject) {
        if sender.isOn == true {
            audioPlayer.play()
        }else{
            audioPlayer.stop()
        }
        
    }
    

}
