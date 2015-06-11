//
//  User.swift
//  Sparks
//
//  Created by Ryan Farley on 6/3/15.
//  Copyright (c) 2015 ryanfarley. All rights reserved.
//

import Foundation

struct User {
    let id: String
    let name: String
    private let pfUser: PFUser
    
    func getPhoto(callback:UIImage -> ()) {
        let imageFile = pfUser.objectForKey("picture") as! PFFile
        imageFile.getDataInBackgroundWithBlock {
            data, error in
            if let data = data {
                callback(UIImage(data: data)!)
            }
        }
    }
}

private func pfUserToUser(user: PFUser) -> User {
    return User(id: user.objectId!, name: user.objectForKey("firstName")as! String, pfUser: user)
}

func currentUser() -> User? {
    if let user = PFUser.currentUser() {
        return pfUserToUser(user)
    }
    return nil
}

func fetchUnviewUsers(callback: ([User]) -> ()) {
    PFUser.query()?.whereKey("objectId", notEqualTo: PFUser.currentUser()!.objectId!).findObjectsInBackgroundWithBlock() { objects, error in
        if let pfUsers = objects as? [PFUser] {
            let users = map(pfUsers, {pfUserToUser($0)})
            callback(users)
        }
    }
}

func saveSkip(user: User) {
    let skip = PFObject(className: "Action")
    skip.setObject(PFUser.currentUser()!.objectId!, forKey: "byUser")
    skip.setObject(user.id, forKey: "toUser")
    skip.setObject("skipped", forKey: "type")
    skip.saveInBackground()
}