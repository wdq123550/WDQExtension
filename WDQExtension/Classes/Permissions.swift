//
//  Permissions.swift
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
import UserNotifications

extension WDQExtension: CLLocationManagerDelegate {
    
    /// 监控网络可达性
    /// - Returns: PassthroughSubject<Bool, Never>
    public func monitorNetworkReachability() -> PassthroughSubject<Bool, Never> {
        let subject = PassthroughSubject<Bool, Never>()
        let reachability = NetworkReachabilityManager(host: "www.apple.com")
        reachability?.startListening(onUpdatePerforming: { status in
            DispatchQueue.main.async {
                switch status {
                case .notReachable:
                    subject.send(false)
                    subject.send(completion: .finished)
                case .unknown:
                    subject.send(false)
                    subject.send(completion: .finished)
                case .reachable(_):
                    subject.send(true)
                    subject.send(completion: .finished)
                }
            }
        })
        return subject
    }
    
    
    //NSPhotoLibraryUsageDescription，NSPhotoLibraryAddUsageDescription
    /// 获取相册使用权限
    /// - Parameter level: 权限等级
    /// - Returns: PassthroughSubject<Bool, Never>
    public func getPhotoPermissions(with level: PHAccessLevel) -> PassthroughSubject<Bool, Never>{
        let subject = PassthroughSubject<Bool, Never>()
        PHPhotoLibrary.requestAuthorization(for: level) { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized, .limited:
                    subject.send(true)
                    subject.send(completion: .finished)
                case .denied, .restricted:
                    subject.send(false)
                    subject.send(completion: .finished)
                default:
                    break
                }
            }
        }
        return subject
    }
    
    //NSCameraUsageDescription
    /// 获取相机权限
    /// - Returns: PassthroughSubject<Bool, Never>
    public func getCameraPermissions() -> PassthroughSubject<Bool, Never>{
        let subject = PassthroughSubject<Bool, Never>()
        AVCaptureDevice.requestAccess(for: .video) { result in
            DispatchQueue.main.async {
                subject.send(result)
                subject.send(completion: .finished)
            }
        }
        return subject
    }
    
    //NSMicrophoneUsageDescription
    /// 获取麦克风权限
    /// - Returns: PassthroughSubject<Bool, Never>
    public func getMicrophonePermissions() -> PassthroughSubject<Bool, Never>{
        let subject = PassthroughSubject<Bool, Never>()
        AVCaptureDevice.requestAccess(for: .audio) { result in
            DispatchQueue.main.async {
                subject.send(result)
                subject.send(completion: .finished)
            }
        }
        return subject
    }
    
    //NSLocationAlwaysAndWhenInUseUsageDescription NSLocationWhenInUseUsageDescription
    /// 获取定位权限
    /// - Parameter level: 权限等级
    /// - Returns: PassthroughSubject<Bool, Never>
    public func getLocationPermissions(with level: LocationPermissionsLevel) -> PassthroughSubject<Bool, Never>{
        let subject = PassthroughSubject<Bool, Never>()
        self.locationPermissionsSubject = subject
        self.locationPermissionsLevel = level
        self.locationManager.delegate = self
        if level == .whenInUse {
            self.locationManager.requestWhenInUseAuthorization()
        }
        if level == .always {
            self.locationManager.requestAlwaysAuthorization()
        }
        return subject
    }
    
    
    /// 定位权限更改
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        DispatchQueue.main.async {
            if manager == self.locationManager {
                switch manager.authorizationStatus {
                case .authorizedAlways where self.locationPermissionsLevel == .always:
                    self.locationPermissionsSubject?.send(true)
                    self.locationPermissionsSubject?.send(completion: .finished)
                case .authorizedWhenInUse where self.locationPermissionsLevel == .whenInUse:
                    self.locationPermissionsSubject?.send(true)
                    self.locationPermissionsSubject?.send(completion: .finished)
                case .denied, .restricted:
                    self.locationPermissionsSubject?.send(false)
                    self.locationPermissionsSubject?.send(completion: .finished)
                default:
                    break
                }
            }
        }
    }
    
    
    /// 获取通知权限
    /// - Returns: PassthroughSubject<Bool, Error>
    public func getRemoteNotificationPermissions() -> PassthroughSubject<Bool, Error> {
        let subject = PassthroughSubject<Bool, Error>()
        UNUserNotificationCenter.current().requestAuthorization { result, error in
            DispatchQueue.main.async {
                if let error {
                    subject.send(completion: .failure(error))
                }else{
                    subject.send(result)
                    subject.send(completion: .finished)
                }
            }
        }
        return subject
    }
}



