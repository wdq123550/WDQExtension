//
//  WDQExtension.swift
//  WDQExtension
//
//  Created by admin  on 2024/8/14.
//

import Foundation
import Alamofire
import Combine
import AVFoundation
import Photos
import CoreLocation
import RxSwift
import RxCocoa
import SVProgressHUD

public let wdq = WDQExtension()

public class WDQExtension: NSObject {
    
    //MARK: - 权限
    var locationManager = CLLocationManager()
    var locationPermissionsSubject: PassthroughSubject<Bool, Never>?
    var locationPermissionsLevel: LocationPermissionsLevel?
    public enum LocationPermissionsLevel {
        case whenInUse
        case always
    }
    
}

