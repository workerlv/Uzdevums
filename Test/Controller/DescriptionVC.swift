//
//  DescriptionVC.swift
//  Getting API data
//
//  Created by Arturs Vitins on 09/12/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController {

    var recDescription = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainTextView)
        mainTextView.attachZeroAnchors(to: self.view)
        
        let data = recDescription.data(using: String.Encoding.unicode)!
        let attrStr = try? NSAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        
         mainTextView.attributedText = attrStr
    }
    
    let mainTextView: UITextView = {
        let txtView = UITextView()
        txtView.translatesAutoresizingMaskIntoConstraints = false
        txtView.isEditable = false
        return txtView
    }()
    
}
