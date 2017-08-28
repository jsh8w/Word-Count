//
//  ViewController.swift
//  Word Count
//
//  Created by James Shaw on 04/09/2016.
//  Copyright © 2016 James Shaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate, UITextViewDelegate {

    // Nav bar attached to top of view
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    // Container View containing CountSummaryView and CountDetailView
    @IBOutlet weak var countContainerView: UIView!
    @IBOutlet weak var countContainerViewHeight: NSLayoutConstraint!
    
    // CountSummaryView and CountDetailView
    var countSummaryView: CountSummaryView!
    var countDetailView: CountDetailView!
    
    // Text View
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation bar and text view delegate
        self.navigationBar.delegate = self
        self.inputTextView.delegate = self
        
        // Create CountSummaryView and CountDetailView
        self.countSummaryView = CountSummaryView()
        self.countSummaryView.alpha = 0.0
        self.countContainerView.addSubview(self.countSummaryView)
        
        self.countDetailView = CountDetailView()
        self.countDetailView.alpha = 1.0
        self.countContainerView.addSubview(self.countDetailView)
        //----------
        
        // Hide the done button
        self.hideDoneButton()
    }
    
    override func viewDidLayoutSubviews() {
        
        // Update our custom UIView frames
        self.countSummaryView.frame = CGRect(x: 0.0, y: 0.0, width: self.countContainerView.frame.width, height: 40.0)
        self.countDetailView.frame = CGRect(x: 0.0, y: 0.0, width: self.countContainerView.frame.width, height: 70.0)
    }
    
    // Set navigation bar attached to status bar
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    // MARK: UITextView Delegate
    func textViewDidChange(_ textView: UITextView) {
        // Call helper and set label texts
        
        // Characters
        let chars = CountHelper.sharedCountHelper.getNumberOfChars(textView.text)
        self.countSummaryView.charsValueLabel.text = "\(chars)"
        self.countDetailView.charsValueLabel.text = "\(chars)"
        //---------
        
        // Words
        let words = CountHelper.sharedCountHelper.getNumberOfWords(textView.text)
        self.countSummaryView.wordsValueLabel.text = "\(words)"
        self.countDetailView.wordsValueLabel.text = "\(words)"
        //-----------
        
        // Lines
        let lines = CountHelper.sharedCountHelper.getNumberOfLines(textView.text, textView: textView)
        self.countDetailView.linesValueLabel.text = "\(lines)"
        //-----------
        
        // Paragraphs
        let paragraphs = CountHelper.sharedCountHelper.getNumberOfParagraphs(textView.text)
        self.countDetailView.paragraphsValueLabel.text = "\(paragraphs)"
        //-----------
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        // Show done button
        self.showDoneButton()
        
        // Show/Hide Summary and Detail
        self.countSummaryView.alpha = 1.0
        
        // Collapse countContainerView
        self.countContainerViewHeight.constant = 40.0
        
        // Update constraints
        self.view.updateConstraints()
        
        // Frame animation
        UIView.animate(withDuration: 0.3, animations: {
            
            self.countDetailView.alpha = 0.0
            
            // Animate frame
            self.view.layoutIfNeeded()
        })
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        // Hide done button
        self.hideDoneButton()
        
        // Show/Hide Summary and Detail
        self.countSummaryView.alpha = 0.0
        self.countDetailView.alpha = 1.0
        
        // Expand countContainerView
        self.countContainerViewHeight.constant = 70.0
        
        // Update constraints
        self.view.updateConstraints()
        
        // Frame animation
        UIView.animate(withDuration: 0.3, animations: {
            
            // Animate frame
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.inputTextView.resignFirstResponder()
    }
    
    func hideDoneButton() {
        self.doneButton.tintColor = UIColor.clear
        self.doneButton.isEnabled = false
    }
    
    func showDoneButton() {
        self.doneButton.tintColor = UIColor.white
        self.doneButton.isEnabled = true
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        
        // Dismiss keyboard in case it's showing
        self.inputTextView.resignFirstResponder()
        
        // Present 'share' view controller from bottom of the view
        let activityViewController = UIActivityViewController(activityItems: [self.inputTextView.text], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        //------------
    }
}

