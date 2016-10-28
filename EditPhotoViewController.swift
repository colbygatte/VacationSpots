//
//  EditPhotoViewController.swift
//  VacationSpots
//
//  Created by Colby Gatte on 10/27/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import CoreData

protocol EditPhotoViewControllerDelegate {
    func editPhotoViewControllerDelelgateDidSave()
}

class EditPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate: EditPhotoViewControllerDelegate?
    
    var imagePicker: UIImagePickerController!
    
    //var photo: UIImage!
    var vacationImage: VacationImage!
    
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var photoImageView: UIImageView!
    
    
    @IBAction func addPhotoButtonPressed() {
        
        let optionMenu = UIAlertController(title: nil, message: "Pick One!", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let choosePhoto = UIAlertAction(title: "Choose Photo", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("choose photo")
            self.choosePictureButtonPressed()
        })
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("take photo")
            self.takePictureButtonPressed()
        })
        
        let cancelAlert = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("cancel ish")
        })
        
        optionMenu.addAction(choosePhoto)
        optionMenu.addAction(takePhoto)
        optionMenu.addAction(cancelAlert)
        
        present(optionMenu, animated: true, completion: nil)
        
    }
    
    func takePictureButtonPressed() {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePictureButtonPressed() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        photoImageView.image = photo!
        vacationImage.image = photo
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    /***  ***/
    @IBAction func sepiaButtonPressed() {
        let newImage = makeMeSepia(image: vacationImage.image)
        photoImageView.image = newImage
        vacationImage.image = newImage
    }
    
    func makeMeSepia(image: UIImage) -> UIImage {
        let context = CIContext(options: nil)
        
        let currentFilter = CIFilter(name: "CISepiaTone")
        let beginImage = CIImage(image: image)
        
        currentFilter?.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter?.setValue(0.5, forKey: kCIInputIntensityKey)
        
        let output = currentFilter?.outputImage
        
        let cgimg = context.createCGImage(output!, from: (output?.extent)!)
        
        let processedImage = UIImage(cgImage: cgimg!)
        
        return processedImage
    }
    
    
    @IBAction func saveButtonPressed() {
        vacationImage.imageDescription = descriptionTextField.text
        delegate?.editPhotoViewControllerDelelgateDidSave()
        dismiss(animated: true, completion: nil)
    }
    
/***********
* NEXT!!!!
*
* Create the "Save" button 
* to call the delegate and dismiss the view controller
***********/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        photoImageView.image = vacationImage.image
        descriptionTextField.text = vacationImage.imageDescription
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
