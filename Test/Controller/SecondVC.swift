//
//  SecondVC.swift
//  Test
//
//  Created by Arturs Vitins on 05/09/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//


import UIKit

class SecondVC: UIViewController {

    var recDescription = String()
    
    @IBOutlet weak var textViewOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewOutlet.isEditable = false

        let formattedHTML = Formatting.formatHTML(text: recDescription)
        
        textViewOutlet.attributedText = formattedHTML
        
    }

}
