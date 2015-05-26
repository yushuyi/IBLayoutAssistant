//
//  UIView+IBLayoutAssistant.swift
//  DoudouApp
//
//  Created by yushuyi on 14/12/11.
//  Copyright (c) 2014年 DoudouApp. All rights reserved.
//

import Foundation
import UIKit


let IBLayoutAssistantDebugMode : Bool = true

public extension UIView {

    //MARK: Top
    var topLayoutConstant : CGFloat? {
        get {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Top,NSLayoutAttribute.TopMargin) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Top,NSLayoutAttribute.TopMargin),let n = newValue { c.constant = n }
        }
    }
    
    //MARK: Bottom
    var bottomLayoutConstant : CGFloat? {
        get {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Bottom,NSLayoutAttribute.BottomMargin) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Bottom,NSLayoutAttribute.BottomMargin),let n = newValue { c.constant = n }
        }
    }
    
    //MARK: Left
    var leftLayoutConstant : CGFloat? {
        get {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Left,NSLayoutAttribute.Leading,NSLayoutAttribute.LeftMargin,NSLayoutAttribute.LeadingMargin) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Left,NSLayoutAttribute.Leading,NSLayoutAttribute.LeftMargin,NSLayoutAttribute.LeadingMargin),let n = newValue { c.constant = n }
        }
    }
    
    //MARK: Right
    var rightLayoutConstant : CGFloat? {
        get {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Right,NSLayoutAttribute.RightMargin,NSLayoutAttribute.Trailing,NSLayoutAttribute.TrailingMargin) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraintInSuperview(NSLayoutAttribute.Right,NSLayoutAttribute.RightMargin,NSLayoutAttribute.Trailing,NSLayoutAttribute.TrailingMargin),let n = newValue { c.constant = n }
        }
    }
    
    //MARK: CenterX
    var centerXLayoutConstant : CGFloat? {
        get {
            if let c = findConstraintInSuperview(NSLayoutAttribute.CenterX) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraintInSuperview(NSLayoutAttribute.CenterX),let n = newValue { c.constant = n }
        }
    }
    
    //MARK: CenterY
    var centerYLayoutConstant : CGFloat? {
        get {
            if let c = findConstraintInSuperview(NSLayoutAttribute.CenterY) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraintInSuperview(NSLayoutAttribute.CenterY),let n = newValue { c.constant = n }
        }
    }
    
    //MARK: Width
    var widthLayoutConstant : CGFloat? {
        get {
            if let c = findConstraint(NSLayoutAttribute.Width) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraint(NSLayoutAttribute.Width),let n = newValue { c.constant = n }
        }
    }
    
    //MARK: Height
    var heightLayoutConstant : CGFloat? {
        get {
            if let c = findConstraint(NSLayoutAttribute.Height) { return c.constant }
            return nil
        }
        set {
            if let c = findConstraint(NSLayoutAttribute.Height),let n = newValue { c.constant = n }
        }
    }
    
    
    //MARK: Private
    private func findConstraint(attribute : NSLayoutAttribute ...) -> NSLayoutConstraint? {
        return diffConstraints(self.constraints(), attribute: attribute)
    }
    
    private func findConstraintInSuperview(attribute : NSLayoutAttribute ...) -> NSLayoutConstraint? {
        return diffConstraints(self.superview!.constraints(), attribute: attribute)
    }
    
    private func diffConstraints(constraints : [AnyObject],attribute : [NSLayoutAttribute]) -> NSLayoutConstraint? {
        
        if let constraints = constraints as? [NSLayoutConstraint] {
            for c in constraints  {
                
                var firstAttribute = c.firstAttribute
                var secondAttribute = c.secondAttribute
                
                if contains(attribute, firstAttribute) {
                    //View In Superview
                    if let firstObject = c.firstItem as? NSObject,let secondObject = c.secondItem as? NSObject
                        where firstObject == self && secondObject == self.superview! && firstAttribute == secondAttribute
                    {
                        return c
                    }
                    
                    if let firstObject = c.firstItem as? NSObject,let secondObject = c.secondItem as? NSObject
                        where secondObject == self && firstObject == self.superview! && firstAttribute == secondAttribute
                    {
                        return c
                    }
                    
                    //Width Height
                    if let firstObject = c.firstItem as? NSObject
                        where firstObject == self && secondAttribute == .NotAnAttribute
                    {
                        return c
                    }
                    
                    if let secondObject = c.secondItem as? NSObject
                        where secondObject == self && secondAttribute == .NotAnAttribute
                    {
                        return c
                    }
                }
            }
            
            for c in constraints {
                
                var firstAttribute = c.firstAttribute
                var secondAttribute = c.secondAttribute
                if contains(attribute, firstAttribute) || contains(attribute, secondAttribute) {
                    //View and View
                    if let firstObject = c.firstItem as? NSObject
                        where firstObject == self
                    {
                        if firstAttribute.rawValue == secondAttribute.rawValue + 1 ||
                            firstAttribute.rawValue == secondAttribute.rawValue - 1
                        {
                            return c
                        }
                        
                    }
                    
                    if let secondObject = c.secondItem as? NSObject
                        where secondObject == self
                    {
                        if firstAttribute.rawValue == secondAttribute.rawValue + 1 ||
                            firstAttribute.rawValue == secondAttribute.rawValue - 1
                        {
                            return c
                        }
                    }
                }
            }
            
        }
        println("在 self（\(self)） 的 superview（\(self.superview)） 中 没有找到 attribute（\(attribute)）")
        return nil
    }
    
    
    //MARK: Todo
    func findConstraint(relationView : UIView) {
    
    }
    
    func debugPrint(c : NSLayoutConstraint) {
        println("firstObject\(c.firstItem) secondObject\(c.secondItem)")
    }
    
}
