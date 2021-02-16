//
//  ViewController.swift
//  camera
//
//  Created by 神山駿 on 2021/02/16.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var checkPermission = Permission()
    
    @IBOutlet weak var backImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission.checkCamera()
    }

    @IBAction func camera(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .camera
        createPicker(sourceType: sourceType)
    }
    
    @IBAction func albam(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createPicker(sourceType: sourceType)
    }
    
    @IBAction func share(_ sender: Any) {
        let text = ""
        let image = backImage.image?.jpegData(compressionQuality: 0.5)
        
        let item = [text, image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func createPicker(sourceType:UIImagePickerController.SourceType){
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.editedImage] as? UIImage{
            backImage.image = pickerImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

