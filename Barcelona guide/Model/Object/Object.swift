//
//  Object.swift
//  Barcelona guide
//
//  Created by Anton Khlomov on 08/12/2022.
//

import Foundation
import CoreLocation



class Object{
    
    var uidObject: String!
    var nameObject: String!
    var categoryObject: String!
    var textObject: String!
    var objectImage: String!
    var latitudeObject: Double!
    var longitudeObject: Double!
    var location: CLLocationCoordinate2D!
    var likeObject: Int!
    var dateCreateObject: Double!
    
    var uidUserСreator: String!
    var nameUserСreator: String!
    var fullNameUserСreator: String!
    var profileImageUserСreator: String!
    var emailUserСreator: String!
    var karmaUserСreator: Int!
   
    
      init(dictionary: [String: Any]) {
        
            
        self.uidObject = dictionary["uidObject"] as? String ?? ""
        self.nameObject = dictionary["nameObject"] as? String ?? ""
        self.categoryObject = dictionary["categoryObject"] as? String ?? ""
        self.textObject = dictionary["textObject"] as? String ?? ""
        self.objectImage = dictionary["objectImage"] as? String ?? ""
        self.latitudeObject = dictionary["latitudeObject"]  as? Double ?? nil
        self.longitudeObject = dictionary["longitudeObject"]  as? Double ?? nil
        self.location = dictionary["location"]  as? CLLocationCoordinate2D ?? nil
        self.likeObject = dictionary["likeObject"]  as? Int ?? nil
         self.uidUserСreator = dictionary["uidUserСreator"] as? String ?? ""
         self.nameUserСreator = dictionary["nameUserСreator"] as? String ?? ""
         self.fullNameUserСreator = dictionary["fullNameUserСreator"] as? String ?? ""
         self.profileImageUserСreator = dictionary["profileImageUserм"] as? String ?? ""
         self.emailUserСreator = dictionary["emailUserСreator"] as? String ?? ""
         self.karmaUserСreator = dictionary["karmaUserСreator"]  as? Int ?? nil
        
    }
}