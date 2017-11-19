//
//  CountDetailView.swift
//  Word Count
//
//  Created by James Shaw on 08/09/2016.
//  Copyright © 2016 James Shaw. All rights reserved.
//

import Foundation
import UIKit

class CountDetailView: UIView {
    
    // Labels
    var charsLabel: UILabel!
    var charsValueLabel: UILabel!
    var wordsLabel: UILabel!
    var wordsValueLabel: UILabel!
    var linesLabel: UILabel!
    var linesValueLabel: UILabel!
    var paragraphsLabel: UILabel!
    var paragraphsValueLabel: UILabel!
    //------------
    
    // Seperator Views
    var topSeperatorView: UIView!
    var bottomSeperatorView: UIView!
    
    // Margins
    let xMargin: CGFloat = 20.0
    let yMargin: CGFloat = 10.0
    let labelHeight: CGFloat = 20.0
    
    init() {
        super.init(frame: CGRect.zero)
        
        // Clear background
        self.backgroundColor = UIColor.clear
        
        // Create topSeperatorView
        self.topSeperatorView = UIView(frame: CGRect.zero)
        self.topSeperatorView.backgroundColor = UIColor.white
        self.addSubview(self.topSeperatorView)
        //----------
        
        // Create bottomSeperatorView
        self.bottomSeperatorView = UIView(frame: CGRect.zero)
        self.bottomSeperatorView.backgroundColor = UIColor.white
        self.addSubview(self.bottomSeperatorView)
        //----------
        
        // Create charsLabel
        self.charsLabel = UILabel(frame: CGRect.zero)
        self.charsLabel.textColor = UIColor.white
        self.charsLabel.textAlignment = .left
        self.charsLabel.backgroundColor = UIColor.clear
        self.charsLabel.text = "Characters:"
        self.charsLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.charsLabel)
        //--------------
        
        // Create charsValueLabel
        self.charsValueLabel = UILabel(frame: CGRect.zero)
        self.charsValueLabel.textColor = UIColor.white
        self.charsValueLabel.textAlignment = .right
        self.charsValueLabel.backgroundColor = UIColor.clear
        self.charsValueLabel.text = "0"
        self.charsValueLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.charsValueLabel)
        //--------------
        
        // Create wordsLabel
        self.wordsLabel = UILabel(frame: CGRect.zero)
        self.wordsLabel.textColor = UIColor.white
        self.wordsLabel.textAlignment = .left
        self.wordsLabel.backgroundColor = UIColor.clear
        self.wordsLabel.text = "Words:"
        self.wordsLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.wordsLabel)
        //--------------
        
        // Create wordsValueLabel
        self.wordsValueLabel = UILabel(frame: CGRect.zero)
        self.wordsValueLabel.textColor = UIColor.white
        self.wordsValueLabel.textAlignment = .right
        self.wordsValueLabel.backgroundColor = UIColor.clear
        self.wordsValueLabel.text = "0"
        self.wordsValueLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.wordsValueLabel)
        //--------------
        
        // Create linesLabel
        self.linesLabel = UILabel(frame: CGRect.zero)
        self.linesLabel.textColor = UIColor.white
        self.linesLabel.textAlignment = .left
        self.linesLabel.backgroundColor = UIColor.clear
        self.linesLabel.text = "Lines:"
        self.linesLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.linesLabel)
        //--------------
        
        // Create linesValueLabel
        self.linesValueLabel = UILabel(frame: CGRect.zero)
        self.linesValueLabel.textColor = UIColor.white
        self.linesValueLabel.textAlignment = .right
        self.linesValueLabel.backgroundColor = UIColor.clear
        self.linesValueLabel.text = "0"
        self.linesValueLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.linesValueLabel)
        //--------------
        
        // Create paragraphsLabel
        self.paragraphsLabel = UILabel(frame: CGRect.zero)
        self.paragraphsLabel.textColor = UIColor.white
        self.paragraphsLabel.textAlignment = .left
        self.paragraphsLabel.backgroundColor = UIColor.clear
        self.paragraphsLabel.text = "Paragraphs:"
        self.paragraphsLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.paragraphsLabel)
        //--------------
        
        // Create paragraphsValueLabel
        self.paragraphsValueLabel = UILabel(frame: CGRect.zero)
        self.paragraphsValueLabel.textColor = UIColor.white
        self.paragraphsValueLabel.textAlignment = .right
        self.paragraphsValueLabel.backgroundColor = UIColor.clear
        self.paragraphsValueLabel.text = "0"
        self.paragraphsValueLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.paragraphsValueLabel)
        //--------------
    }
    
    // Called once we have a frame for the view
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Get the view's frame
        let frame = self.frame
        
        // Separator View
        let seperatorYMargin: CGFloat = 6.0
        self.topSeperatorView.frame = CGRect(x: (frame.width / 2), y: seperatorYMargin, width: 0.5, height: (frame.height/2) - (2 * seperatorYMargin))
        self.bottomSeperatorView.frame = CGRect(x: (frame.width / 2), y: seperatorYMargin + (frame.height/2), width: 0.5, height: (frame.height/2) - (2 * seperatorYMargin))
        //----------
        
        // Width of value labels
        let valueLabelWidth: CGFloat = 50.0
        let valueLabelXMargin: CGFloat = 8.0
        
        // Set frame of charsLabel and charsValueLabel
        let charsLabelWidth = (frame.width / 2) - self.xMargin - valueLabelWidth - valueLabelXMargin
        self.charsLabel.frame = CGRect(x: self.xMargin, y: self.yMargin, width: charsLabelWidth, height: self.labelHeight)
        let charsValueLabelX = (frame.width / 2) - self.xMargin - valueLabelWidth
        self.charsValueLabel.frame = CGRect(x: charsValueLabelX, y: self.yMargin, width: valueLabelWidth, height: self.labelHeight)
        //-----------
        
        // Set frame of wordsLabel
        let wordsLabelX = (frame.width / 2) + self.xMargin
        let wordsLabelWidth = (frame.width / 2) - self.xMargin - valueLabelWidth - valueLabelXMargin
        self.wordsLabel.frame = CGRect(x: wordsLabelX, y: self.yMargin, width: wordsLabelWidth, height: self.labelHeight)
        let wordsValueLabelX = frame.width - self.xMargin - valueLabelWidth
        self.wordsValueLabel.frame = CGRect(x: wordsValueLabelX, y: self.yMargin, width: valueLabelWidth, height: self.labelHeight)
        //-----------
        
        // Set frame of linesLabel
        let linesLabelY = self.charsLabel.frame.origin.y + self.charsLabel.frame.height + self.yMargin
        let linesLabelWidth = (frame.width / 2) - self.xMargin - valueLabelWidth - valueLabelXMargin
        self.linesLabel.frame = CGRect(x: self.xMargin, y: linesLabelY, width: linesLabelWidth, height: self.labelHeight)
        let linesValueLabelX = (frame.width / 2) - self.xMargin - valueLabelWidth
        self.linesValueLabel.frame = CGRect(x: linesValueLabelX, y: linesLabelY, width: valueLabelWidth, height: self.labelHeight)
        //-----------
        
        // Set frame of wordsLabel
        let paragraphsLabelY = self.wordsLabel.frame.origin.y + self.wordsLabel.frame.height + self.yMargin
        self.paragraphsLabel.frame = CGRect(x: wordsLabelX, y: paragraphsLabelY, width: wordsLabelWidth, height: self.labelHeight)
        let paragraphsValueLabelX = frame.width - self.xMargin - valueLabelWidth
        self.paragraphsValueLabel.frame = CGRect(x: paragraphsValueLabelX, y: paragraphsLabelY, width: valueLabelWidth, height: self.labelHeight)
        //-----------
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
