//
//  VacationCollectionViewController.swift
//  VacationSpots
//
//  Created by Colby Gatte on 10/26/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "myCell"

class VacationCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, EditPhotoViewControllerDelegate {

    var images: [VacationImage]!
    //var imagePicker: UIImagePickerController!
    
    @IBAction func addVacationPhotoButtoPressed() {
        let newImage = VacationImage(UIImage(), description: "Add Description")
        images.append(newImage)
        collectionView?.reloadData()
    }
    
    
    func editPhotoViewControllerDelelgateDidSave() {
        print("111 save photo delegate called")
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = [
            VacationImage(UIImage(named: "bread.jpg")!, description: "i love vacation"),
            VacationImage(UIImage(named: "bread.jpg")!, description: "bread!!!!"),
            VacationImage(UIImage(named: "bread.jpg")!, description: "----okay--------"),
            VacationImage(UIImage(named: "bread.jpg")!, description: "mark")
        ]
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditPhoto" {
            let editPhotoVC = segue.destination as! EditPhotoViewController
            let indexPath = collectionView?.indexPathsForSelectedItems?[0]
            
            
            editPhotoVC.delegate = self
            editPhotoVC.vacationImage = images[(indexPath?.row)!] as VacationImage
            
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        
        cell.imgDescription.text = images[indexPath.row].imageDescription
        cell.imgView.image = images[indexPath.row].image
        
        cell.backgroundColor = UIColor.blue
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
