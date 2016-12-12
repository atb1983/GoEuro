//
//  Theme.swift
//  GoEuroTest
//
//  Created by Alex Núñez on 11/12/2016.
//  Copyright © 2016. All rights reserved.
//

import UIKit

@objc class Theme: NSObject {
	
	class func apply() {
		
		// Theme
		UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
		UINavigationBar.appearance().barTintColor = self.themeBlue();
		UIToolbar.appearance().tintColor = UIColor.white
		UIToolbar.appearance().barTintColor = self.themeBlue();
		UITabBar.appearance().tintColor = UIColor.white
		UITabBar.appearance().barTintColor = self.themeBlue();
		let attributes = [
			NSFontAttributeName : UIFont.systemFont(ofSize: CGFloat(17.0))
		]
		
		UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
		UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -13.0)

		let shadow = NSShadow()
		shadow.shadowColor! = UIColor(red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(0.7))
		shadow.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(1))
		UINavigationBar.appearance().titleTextAttributes = [
			NSForegroundColorAttributeName : UIColor.white,
			NSShadowAttributeName : shadow,
			NSFontAttributeName : UIFont.systemFont(ofSize: CGFloat(21.0))
		]
		
	}
	
	// Blue
	class func themeBlue() -> UIColor {
		return UIColor(red: CGFloat(0.0 / 255.0), green: CGFloat(74.0 / 255.0), blue: CGFloat(134.0 / 255.0), alpha: CGFloat(1.0))
	}
	
	// Blue with alpfha
	class func themeCellHighlightColour() -> UIColor {
		return UIColor(red: CGFloat(0.0 / 255.0), green: CGFloat(74.0 / 255.0), blue: CGFloat(134.0 / 255.0), alpha: CGFloat(0.3))
	}
}
