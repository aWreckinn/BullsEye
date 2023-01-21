//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Adam Bufalini on 1/19/23.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {@IBAction func close() {
    dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    

        // Do any additional setup after loading the view.
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
