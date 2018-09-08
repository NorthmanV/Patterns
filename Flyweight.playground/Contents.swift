//: Flyweight

import UIKit

class MikeMyers {
    let name: String
    let skills: Int
    
    var role: String?
    var roleAge: Int?
    
    init() {
        self.name = "Mike Myers"
        self.skills = 80
    }
    
    func getInfo() -> String {
        if let role = role, let roleAge = roleAge  {
            return "Role - \(role), age \(roleAge)"
        } else {
            return "No role"
        }
    }
}

let mike = MikeMyers()
mike.getInfo()  // "No role"

mike.role = "Dr. Evil"
mike.roleAge = 55
mike.getInfo()  // "Role - Dr. Evil, age 55"

mike.role = "Austin Powers"
mike.roleAge = 30
mike.getInfo()  // "Role - Austin Powers, age 30"








