//
//  ApplicationHelper.swift
//  Pods
//
//  Created by Lukasz on 31/08/2017.
//
//

import UIKit

public struct ApplicationHelper {
    
    public static var versionName: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    public static var buildNumber: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    
    public static func open(phone: String) {
        guard let number = URL(string: "tel://\(phone.digitsOnly())") else { return }
        
        open(url: number)
    }
    
    public static func open(addressInMaps address: String) {
        guard let url = URL(string: "http://maps.apple.com/?address=\(address.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")") else { return }
        
        open(url: url)
    }
    
    public static func open(url: String) {
        guard let it = URL(string: url) else { return }
        open(url: it)
    }
    
    public static func open(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    
}
