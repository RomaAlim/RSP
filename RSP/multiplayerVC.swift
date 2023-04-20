//
//  multiplayerVC.swift
//  RSP
//
//  Created by Ramazan Kalabay on 18.02.2023.
//

import UIKit
import AVFoundation

class multiplayerVC: UIViewController {
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

    
    @IBOutlet weak var a: UILabel!
    
    @IBOutlet weak var b: UILabel!
    
    @IBOutlet weak var c: UILabel!
    
    @IBOutlet weak var d: UILabel!
    
    @IBOutlet weak var e: UILabel!
    
    @IBOutlet weak var f: UILabel!
    
    @IBOutlet weak var g: UILabel!
    
    
    @IBOutlet weak var akmbutton: UIButton!
    
    var audioPlayer = AVAudioPlayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        akmbutton.layer.cornerRadius = 10
        
        assignbackground()
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "magic", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        a.isHidden = false
        b.isHidden = false
        c.isHidden = false
        d.isHidden = false
        e.isHidden = false
        f.isHidden = false
        g.isHidden = false
        
    }
    
    var first: Bool = true
    var second: Bool = false
    
    @IBAction func akma(_ sender: Any) {
        if first == true {
            
            a.text = "❤️"
            b.text = "❤️‍🔥"
            c.text = "❣️"
            d.text = "💖"
            e.text = "💗"
            f.text = "💞"
            g.text = "💘"
            
            first = false
            audioPlayer.currentTime = 0
            audioPlayer.play()
        } else if first == false{
            a.text = " "
            b.text = " "
            c.text = " "
            d.text = " "
            e.text = " "
            f.text = " "
            g.text = " "
            first = true
            audioPlayer.stop()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func assignbackground(){
        let background = UIImage(named: "pink.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}
