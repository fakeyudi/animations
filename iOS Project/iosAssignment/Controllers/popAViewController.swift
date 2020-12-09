//
//  popAViewController.swift
//  iosAssignment
//
//  Created by Utkarsh Dixit on 9/12/20.
//

import UIKit

class popAViewController: UIViewController {
    
    
    @IBOutlet var emptyLabels: [UILabel]!
    @IBOutlet var emptyViews: [UIView]!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var animationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setDesign()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
    func initialSetup(){
    animationView.alpha=0
        emptyLabels[0].transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    //setDesign function is used to set all the design aspects of the view
    func setDesign(){
        for i in emptyLabels{
            i.emptyStates()}
        for i in emptyViews{
            i.emptyState()}
        nextButton.roundedDesign()
    }
    
    //animate function contains the animator used to animate properties
    func animate(){
        let animator = UIViewPropertyAnimator(duration:0.4, curve: .easeIn) {
            self.animationView.frame = self.animationView.frame.offsetBy(dx:-100, dy:0)
            self.emptyLabels[0].transform = CGAffineTransform(scaleX: 1, y: 1)
            self.animationView.alpha = 1
        }
        animator.startAnimation()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        view.isHidden=true
    }
    

   

}
