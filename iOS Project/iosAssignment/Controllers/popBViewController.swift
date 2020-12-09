//
//  popBViewController.swift
//  iosAssignment
//
//  Created by Utkarsh Dixit on 9/12/20.
//

import UIKit

class popBViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet var bottomLabels: [UILabel]!
    @IBOutlet var numberLabels: [UILabel]!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var bottomView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        initialSetup()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
    
    //setting inital design
    func setDesign(){
        topLabel.emptyStates()
        subLabel.emptyStates()
        numberLabels[0].backgroundColor  = .green
        for i in numberLabels{
            i.roundedLabel()
        }
        for j in bottomLabels{
            j.emptyStates()
        }
        nextButton.roundedDesign()
    }
    
    //initial animation setup
    func initialSetup(){
    animationView.alpha=0
    }
    
    //all animations are executed here
    func animate(){
        let animator = UIViewPropertyAnimator(duration:0.3, curve: .easeIn) {
            self.animationView.alpha=1
            self.animationView.frame = self.animationView.frame.offsetBy(dx:-100, dy:0)
            self.topLabel.frame = self.topLabel.frame.offsetBy(dx:0, dy:-10)
            self.bottomView.frame = self.bottomView.frame.offsetBy(dx:0, dy:-5)
        }
        animator.startAnimation()
    }

}
