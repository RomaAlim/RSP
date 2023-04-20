//
//  gamefortwoVC.swift
//  RSP
//
//  Created by Ramazan Kalabay on 18.02.2023.
//

import UIKit

class gamefortwoVC: UIViewController {
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

    
    @IBOutlet weak var rockbutton: UIButton!
    
    @IBOutlet weak var scissorsbutton: UIButton!
    
    @IBOutlet weak var paperbutton: UIButton!
    
    @IBOutlet weak var resultbutton: UIButton!
    
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var firstperson: UIImageView!
    
    @IBOutlet weak var secondperson: UIImageView!

    var pictures = [UIImage(named: "paper.png"), UIImage(named: "rock.png"), UIImage(named: "scissors.png"), UIImage(named: "draw.png")]
    
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
        
        rockbutton.layer.cornerRadius = 10
        scissorsbutton.layer.cornerRadius = 10
        paperbutton.layer.cornerRadius = 10
        resultbutton.layer.cornerRadius = 10
        
        assignbackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        rockbutton.isHidden = false
        scissorsbutton.isHidden = false
        paperbutton.isHidden = false
    }
    
    var firstper = true
    var secondper = false
    var rock1: Int = 0
    var sciss1: Int = 0
    var paper1: Int = 0
    var game1 = 0
    var game2 = 0
    
    @IBAction func rock(_ sender: Any) {
        if firstper == true{
            self.rock1 += 1
            self.firstper = false
            self.secondper = true
            self.game1 = 1
        }else if secondper == true{
            self.rock1 += 1
            self.game2 = 1
            self.secondper = false
        } else if secondper == false && firstper == false{
            ishidden()
        }
        
    }
    
    
    
    
    @IBAction func scissors(_ sender: Any) {
        if firstper == true{
            self.sciss1 += 1
            self.firstper = false
            self.secondper = true
            self.game1 = 2
        }else if secondper == true{
            self.sciss1 += 1
            self.game2 = 2
            self.secondper = false
        }else if secondper == false && firstper == false{
            ishidden()
        }
    }
    
    
    
    
    @IBAction func paper(_ sender: Any) {
        if firstper == true{
            self.paper1 += 1
            self.firstper = false
            self.secondper = true
            self.game1 = 3
        } else if secondper == true{
            self.paper1 += 1
            self.game2 = 3
            self.secondper = false
        }else if secondper == false && firstper == false{
            ishidden()
        }
    }
    
    func ishidden(){
        rockbutton.isHidden = true
        scissorsbutton.isHidden = true
        paperbutton.isHidden = true
    }
    func resetfunc() {
        self.firstper = true
        self.secondper = false
        self.rock1 = 0
        self.sciss1 = 0
        self.paper1 = 0
        self.game1 = 0
        self.game2 = 0
    }
    
    @IBAction func resultrun(_ sender: Any) {
        rockbutton.isHidden = false
        scissorsbutton.isHidden = false
        paperbutton.isHidden = false
        
        if rock1 == 2{
            firstperson.image = pictures[1]
            secondperson.image = pictures[1]
            Result.text = "Draw"
            resetfunc()
            
        }

        if sciss1 == 2{
            firstperson.image = pictures[2]
            secondperson.image = pictures[2]
            Result.text = "Draw"
            resetfunc()
        }
        if paper1 == 2{
            firstperson.image = pictures[0]
            secondperson.image = pictures[0]
            Result.text = "Draw"
            resetfunc()
        }
        if rock1 == 1 && sciss1 == 1 {
            if game1 == 1{
                firstperson.image = pictures[1]
                secondperson.image = pictures[2]
                Result.text = " First person WIN "
                resetfunc()
            }
            if game2 == 1{
                firstperson.image = pictures[2]
                secondperson.image = pictures[1]
                Result.text = " Second person WIN"
                resetfunc()
            }
        }
        if rock1 == 1 && paper1 == 1{
            if game1 == 3{
                firstperson.image = pictures[0]
                secondperson.image = pictures[1]
                Result.text = "First person WIN "
                resetfunc()
            }
            if game2 == 3{
                firstperson.image = pictures[1]
                secondperson.image = pictures[0]
                Result.text = " Second person WIN"
                resetfunc()
            }
            
        }
        if paper1 == 1 && sciss1 == 1{
            if game1 == 2{
                firstperson.image = pictures[2]
                secondperson.image = pictures[0]
                Result.text = "First person WIN "
                resetfunc()
            }
            if game2 == 2{
                firstperson.image = pictures[0]
                secondperson.image = pictures[2]
                Result.text = " Second person WIN"
                resetfunc()
            }
        }
    }
    

}
