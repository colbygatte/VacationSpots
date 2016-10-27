//
//  VacationImage.swift
//  VacationSpots
//
//  Created by Colby Gatte on 10/26/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class VacationImage: NSObject {
    var imageDescription: String!
    var image: UIImage!
    
    init(_ image: UIImage, description: String) {
        self.image = image
        self.imageDescription = description
    }
}
