//
//  ViewController.swift
//  IBLayoutAssistantDemo
//
//  Created by yushuyi on 15/5/25.
//  Copyright (c) 2015年 yushuyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var centerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeWidthAction(sender: AnyObject) {
        greenView.widthLayoutConstant! += 20.0
    }

    @IBAction func changeHeightAction(sender: AnyObject) {
        greenView.heightLayoutConstant! += 10.0
    }
    
    @IBAction func changeTopAction(sender: AnyObject) {
        greenView.topLayoutConstant! += 10
    }
    
    @IBAction func changeBottomAction(sender: AnyObject) {
        grayView.bottomLayoutConstant! += 10
    }
    @IBAction func changeLeftAction(sender: AnyObject) {
        
        greenView.leftLayoutConstant! += 10
        
    }
    @IBAction func changeCenterXAction(sender: AnyObject) {
        centerView.centerXLayoutConstant! += 10
    }
    
    @IBAction func changeCenterYAction(sender: AnyObject) {
        centerView.centerYLayoutConstant! += 10
    }
}

