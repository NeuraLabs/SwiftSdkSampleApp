//
//  AppDelegate.swift
//  NeuraTutorialSample
//
//  Created by Asaf Spitzer on 04/04/2021.
//

import UIKit
import NeuraSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Neura.setup(launchOptions: launchOptions, appSecret: "RCTQSLm8U0CPKXkM84ymFBEpMQgMwDO-42UCwrIquTo")
        // Override point for customization after application launch.
        return true
    }
}

