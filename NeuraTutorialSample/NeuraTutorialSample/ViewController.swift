//
//  ViewController.swift
//  NeuraTutorialSample
//
//  Created by Asaf Spitzer on 04/04/2021.
//

import UIKit
import NeuraSDK
import CoreLocation
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    var locationManager: CLLocationManager?
    
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var sdkVersion: UILabel!
    
    @IBAction func authenticate(_ sender: Any) {
        let request = NeuraAnonymousAuthenticationRequest()
        NeuraSDK.shared.authenticate(with: request) { result in
            print(result.success)
            refresh()
        }
    }
    
    @IBAction func setExternalId(_ sender: Any) {
        let externaId = NExternalId(externalId: "asaf collector id")
        Neura.externalId = externaId
    }
    
    @IBAction func engagement(_ sender: Any) {
        if !Neura.isAuthenticated {
            print("oh oh")
        }
        
        do {
            try Neura.tagEngagementFeature("collector", action: .close)
        } catch let error {
            print(error)
        }
        
        
    }
    
    @IBAction func locationPermitions(_ sender: Any) {
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
    }
    
    @IBAction func notification(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        // set the type as sound or badge
        center.requestAuthorization(options: [.sound,.alert,.badge]) { (granted, error) in
            if granted {
                print("Notification Enable Successfully")
            }else{
                print("Some Error Occure")
            }
        }
        
    }
    
    func refresh(){
        userID.text = Neura.userId
        state.text = Neura.isAuthenticated ? "authenticated" : "not authenticated"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        // Do any additional setup after loading the view.
    }
    
    
}

