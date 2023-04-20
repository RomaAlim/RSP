//
//  ViewController.swift
//  RSP
//
//  Created by Ramazan Kalabay on 17.02.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
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

    
    
    @IBOutlet weak var aiphone: UIImageView!
    
    @IBOutlet weak var youchoose: UIImageView!
    
    @IBOutlet weak var Result: UILabel!
    
    
    var pictures = [UIImage(named: "paper.png"), UIImage(named: "rock.png"), UIImage(named: "scissors.png"), UIImage(named: "draw.png")]
    func random(min: Int, max: Int) -> Int {
        return Int.random(in: min...max)
    }
    
    
    @IBOutlet weak var rockbutton: UIButton!
    
    @IBOutlet weak var scissorsbutton: UIButton!
    
    @IBOutlet weak var paperbutton: UIButton!
    
    @IBOutlet weak var resetbutton: UIButton!
    
    @IBOutlet weak var aiscore: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    var audioPlayerwin = AVAudioPlayer()
    
    var audioPlayerlose = AVAudioPlayer()
    
    var audioPlayerdraw = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rockbutton.layer.cornerRadius = 10
        scissorsbutton.layer.cornerRadius = 10
        paperbutton.layer.cornerRadius = 10
        resetbutton.layer.cornerRadius = 10
        
        do{
            audioPlayerwin = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "win_sound", ofType: "wav")!))
            audioPlayerwin.prepareToPlay()
        } catch {
            
        }
        
        do{
            audioPlayerlose = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "lose_sound", ofType: "wav")!))
            audioPlayerlose.prepareToPlay()
        } catch {
            
        }
        
        do{
            audioPlayerdraw = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "draw", ofType: "mp3")!))
            audioPlayerdraw.prepareToPlay()
        } catch {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    var yourscore: Int = 0
    var aiscores: Int = 0
 
    @IBAction func rock(_ sender: Any) {
        
        youchoose.image = pictures[1]
        let num = random(min: 0, max: 2)
        aiphone.image = pictures[num]
        soundoff()
        switch num{
        case 0:
            lose()
        case 1:
            draw()
        case 2:
            win()
        default:
            Result.text = " "
        }
    }
    
    @IBAction func scissors(_ sender: Any) {
        youchoose.image = pictures[2]
        let num = random(min: 0, max: 2)
        aiphone.image = pictures[num]
        soundoff()
        switch num{
        case 1:
            lose()
        case 2:
            draw()
        case 0:
            win()
        default:
            Result.text = " "
        }
    }
    
    @IBAction func paper(_ sender: Any) {
        youchoose.image = pictures[0]
        let num = random(min: 0, max: 2)
        aiphone.image = pictures[num]
        soundoff()
        switch num{
        case 2:
            lose()
        case 0:
            draw()
        case 1:
            win()
        default:
            Result.text = " "
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        self.aiscores = 0
        self.yourscore = 0
        aiscore.text = String(aiscores)
        score.text = String(yourscore)
        self.view.backgroundColor = .lightGray
        aiphone.image = pictures[3]
        youchoose.image = pictures[3]
        Result.text = "VS"
        soundoff()
    }
    
    func win() {
        Result.text = "Win"
        self.yourscore += 1
        score.text = String(yourscore)
        self.view.backgroundColor = .green
        audioPlayerwin.currentTime = 0
        audioPlayerwin.play()
    }
    func lose(){
        Result.text = "Lose"
        self.view.backgroundColor = .red
        self.aiscores += 1
        aiscore.text = String(aiscores)
        audioPlayerlose.currentTime = 0
        audioPlayerlose.play()
    }
    func draw(){
        Result.text = "Draw"
        self.view.backgroundColor = .yellow
        audioPlayerdraw.currentTime = 0
        audioPlayerdraw.play()
    }
    func soundoff(){
        audioPlayerlose.stop()
        audioPlayerwin.stop()
        audioPlayerdraw.stop()
    }
}

