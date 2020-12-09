//
//  OverlayViewController.swift
//  iosAssignment
//
//  Created by Utkarsh Dixit on 9/12/20.
//

import UIKit

class OverlayViewController: UIViewController {

    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var IDView1: UIView!
    @IBOutlet weak var IDLabel1: UILabel!
    @IBOutlet weak var IDSubLabel1: UILabel!
    @IBOutlet weak var IDView2: UIView!
    @IBOutlet weak var IDLabel2: UILabel!
    @IBOutlet weak var IDSubLabel2: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var IDView2RightConstraint: NSLayoutConstraint!
    @IBOutlet weak var IDLabel2RightConstraint: NSLayoutConstraint!
    @IBOutlet weak var IDSubLabel2RightConstraint: NSLayoutConstraint!
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        setDesign()
            setInitial()
    }
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    func setInitial(){
        headerLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        IDView2RightConstraint.constant-=160
        
    }
    
    func setDesign(){
        headerLabel.emptyStates()
        IDLabel1.emptyStates()
        IDLabel2.emptyStates()
        IDSubLabel1.emptyStates()
        IDSubLabel2.emptyStates()
        IDView1.emptyState()
        IDView2.emptyState()
        NextButton.roundedDesign()
    }
    
    func animate(){
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.headerLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.IDView2RightConstraint.constant+=160
            self.view.layoutSubviews()
        }, completion: nil)
        /*let animator=UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.headerLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        animator.startAnimation()*/
       
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
}
