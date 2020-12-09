//
//  secondViewController.swift
//  iosAssignment
//
//  Created by Utkarsh Dixit on 7/12/20.
//

import UIKit
import Lottie
import ShimmerSwift

class secondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var animatedCloseButton: AnimationView!
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var aboutText: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var downloadButtonRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var downloadButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var candyBustLabel: UILabel!
    @IBOutlet weak var iconViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var candyBustLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var candyBustTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var translucentView: UIView!
    
    @IBOutlet weak var downloadedDataLabel: UILabel!
    @IBOutlet weak var downloadView: ProgressBar!
    @IBOutlet weak var downloadAnimation: AnimationView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playButtonLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var playButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var playButtonRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var darkenView: UIView!
    
    
    var timer = Timer() //timer variable for progress bar
    var totalTime = 3
    var secondsPassed = 0
    
    let shimmerview = ShimmeringView(frame: CGRect(x: 26, y: 722, width: 338, height: 51))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialAnimationSetup()
        setDesign()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        darkenView.isHidden=true
        animation()
        

    }
    
    //Setting up the initial design of the view
    func setDesign(){
        iconView.squareDesign()
        aboutText.readMoreLabel()
        collectionView.delegate = self
        collectionView.dataSource = self
        downloadButton.roundedDesign()
        downloadButton.titleLabel?.numberOfLines=2
        playButton.clipsToBounds=true
        playButton.layer.cornerRadius=(playButton.frame.height)/2
        playButton.isHidden=true
        let shimmeringLayer = ShimmeringLayer(layer: playButton.layer)
        playButton.layer.addSublayer(shimmeringLayer)
        shimmeringLayer.isShimmering = true
        /*view.addConstraints([
            NSLayoutConstraint(item: shimmerview, attribute: .leading, relatedBy: .equal, toItem: playButton, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: shimmerview, attribute: .trailing, relatedBy: .equal, toItem: playButton, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: shimmerview, attribute: .top, relatedBy: .equal, toItem: playButton, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: shimmerview, attribute: .bottom, relatedBy: .equal, toItem: playButton, attribute: .bottom, multiplier: 1, constant: 0)
            ])*/
        view.addSubview(shimmerview)
        //shimmerview.contentView = playButton
        shimmerview.isShimmering = true
        
    }
    
    //setting up initial begining of all animations
    func initialAnimationSetup(){
        iconViewTopConstraint.constant += 100
        iconViewLeftConstraint.constant += 100
        candyBustLeftConstraint.constant += 100
        collectionViewLeftConstraint.constant += 50
        collectionView.alpha = 0
        candyBustLabel.alpha=0
        aboutText.alpha=0
        readMoreButton.alpha=0
        downloadButtonBottomConstraint.constant += 50
        downloadView.isHidden=true
        translucentView.layer.cornerRadius = translucentView.frame.height/2
        translucentView.isHidden=true
        downloadedDataLabel.isHidden=true
        downloadAnimation.contentMode = .scaleAspectFit
        downloadAnimation.loopMode = .playOnce
        downloadAnimation.pause()
        downloadAnimation.alpha=0
        //playButtonLeftConstraint.constant += 100
        //playButtonRightConstraint.constant += 100
        playButtonBottomConstraint.constant -= 100
        darkenView.isHidden=true
    }
    
    //all animations to happen on loading view
    func animation(){
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.iconViewTopConstraint.constant -= 100
            self.iconViewLeftConstraint.constant -= 100
            self.downloadButtonBottomConstraint.constant -= 50
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.5, options: .curveEaseInOut, animations: {
            self.aboutText.alpha=1
            self.readMoreButton.alpha=1
            self.collectionView.alpha = 1
            self.collectionViewLeftConstraint.constant -= 50
            self.view.layoutIfNeeded()
            
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.candyBustLeftConstraint.constant -= 100
            self.view.layoutIfNeeded()
            self.candyBustLabel.alpha = 1
        }, completion: nil)
        
        animatedCloseButton.contentMode = .scaleAspectFit
        animatedCloseButton.loopMode = .playOnce
        animatedCloseButton.animationSpeed = 1
        animatedCloseButton.play()
        
    }
    
    //animations after button is pressed
    func buttonAnimation(){
        
        //resizing of download button
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.downloadButtonRightConstraint.constant += 80
            self.view.layoutIfNeeded()
        }, completion: nil)
        //appearing of progressbr
        UIView.animate(withDuration: 0.1, delay: 0.3, options: .curveEaseIn, animations: {
            self.downloadButton.alpha=0
            self.downloadView.isHidden=false
        }, completion: nil)
        //launch of progressbar
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.translucentView.isHidden=false
            self.downloadedDataLabel.isHidden=false
            self.downloadAnimation.alpha=1
            self.translucentView.backgroundColor=#colorLiteral(red: 0.2196078431, green: 0.7607843137, blue: 0.2274509804, alpha: 0.4861897854)
            self.downloadView.color = #colorLiteral(red: 0.2196078431, green: 0.7607843137, blue: 0.2274509804, alpha: 1)
            self.timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(self.updateTimer), userInfo:nil, repeats: true)
        
        }, completion: nil)
        
    }
    
    //ending all animations
    func animationFin(){
       
            self.downloadButton.isHidden=true
           self.downloadAnimation.isHidden=true
           self.downloadView.isHidden=true
           self.downloadedDataLabel.isHidden=true
        self.playButton.isHidden=false
        self.translucentView.isHidden=true
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            
            self.playButtonBottomConstraint.constant += 100
            self.view.layoutIfNeeded()
        }, completion: nil)
        
      
        
    }
    
    
    @IBAction func readMoreButton(_ sender: Any) {
        aboutText.fullContent() //read more button
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3 //number of cells in collection view
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCell", for: indexPath) as! imageCollectionViewCell
        return cell
    }
    
    @IBAction func downloadButton(_ sender: Any) {
        buttonAnimation()
    }

    
    @IBAction func playButton(_ sender: Any) {
        darkenView.isHidden=false
        self.performSegue(withIdentifier: "popUp", sender: self) //launching popups
        
    }
    
    //timer function to handle events after timer
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            downloadView.progress=CGFloat((Float(secondsPassed) / Float(totalTime)))
            //print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate()
            downloadAnimation.play()
            let secondsToDelay = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now()+secondsToDelay) {
                self.animationFin()
            }
            
        
        }
    }
    
    

}
