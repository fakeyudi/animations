//
//  extensions.swift
//  iosAssignment
//
//  Created by Utkarsh Dixit on 8/12/20.
//

import Foundation
import UIKit
extension UIView{
    
    func mainDesign(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 40
    }
    func squareDesign(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 30
        self.backgroundColor = #colorLiteral(red: 1, green: 0.9529411765, blue: 0, alpha: 1)
    }
    func emptyState(){
        self.clipsToBounds=true
        self.layer.cornerRadius=self.frame.height/2
    }
    
}

extension UIButton{
    func roundedDesign(){
        self.clipsToBounds = true
        self.layer.cornerRadius = (self.frame.height)/2
    }
}
extension UILabel{
    func readMoreLabel(){
        self.sizeToFit()
        self.numberOfLines = 2
    }
    func fullContent(){
        self.numberOfLines = 0
        self.sizeToFit()
    }
    func emptyStates(){
        self.clipsToBounds=true
        self.text=nil
        self.layer.cornerRadius=4
    }
    func roundedLabel(){
        self.clipsToBounds=true
        self.layer.cornerRadius=self.frame.height/2
    }
}
