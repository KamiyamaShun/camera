//
//  Permission.swift
//  camera
//
//  Created by 神山駿 on 2021/02/16.
//

import Foundation
import Photos

class Permission{
    func checkCamera(){
        PHPhotoLibrary.requestAuthorization{(status) in
            switch(status){
            case .authorized:
                print("authorized")
                
            case .notDetermined:
                    print("not_authorized")
                
            case .restricted:
                    print("restricted")
                
            case .denied:
                    print("denied")
                
            case .limited:
                    print("limited")
                
            @unknown default:
                break
            }
        }
    }
}
