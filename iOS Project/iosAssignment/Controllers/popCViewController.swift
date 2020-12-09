//
//  popCViewController.swift
//  iosAssignment
//
//  Created by Utkarsh Dixit on 9/12/20.
//

import UIKit

class popCViewController: UIViewController {
    
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var centerAnimationView: UIView!
    @IBOutlet weak var bottomAnimationView: UIView!
    @IBOutlet weak var topAnimationView: UIView!
    @IBOutlet var centerLables: [UILabel]! //labels with similar design are grouped in one array
    @IBOutlet var emptyLabels: [UILabel]! //labels with similar design are grouped in one array
    @IBOutlet weak var confirmButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        initialSetup()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
    func setDesign(){
        for i in emptyLabels{
            i.emptyStates()
        }
        for i in centerLables{
            i.roundedLabel()
            i.text=nil
        }
        confirmButton.roundedDesign()
        confirmButton.alpha=0.9
    }
    func initialSetup(){
        readyLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        gameNameLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        confirmButton.alpha=0.4
    }
    func animate(){
        let animator = UIViewPropertyAnimator(duration:0.4, curve: .easeIn) {
            self.centerAnimationView.frame = self.centerAnimationView.frame.offsetBy(dx:-100, dy:0)
            self.readyLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.gameNameLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bottomAnimationView.frame=self.bottomAnimationView.frame.offsetBy(dx: 0, dy: 10)
            self.topAnimationView.frame=self.topAnimationView.frame.offsetBy(dx: 0, dy: 5)
            self.confirmButton.alpha=0.9
        }
        animator.startAnimation()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
