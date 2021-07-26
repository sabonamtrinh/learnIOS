//
//  ProfileViewModel.swift
//  OT
//
//  Created by namtrinh on 20/07/2021.
//

import Foundation
import UIKit

enum ProfileViewModelItemType {
    case nameAndPicture
    case about
    case email
    case friends
    case attribute
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
}

class ProfileViewModel: NSObject {
    var items = [ProfileViewModelItem]()
    
    override init() {
        super.init()
        guard let data = dataFromFile("ServerData"),
              let profile = Profile(data: data) else {
            return
        }
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let namePictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
            items.append(namePictureItem)
        }
        
        if let about = profile.about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            items.append(aboutItem)
        }
        
        if let email = profile.email {
            let emailItem = ProfileViewModelEmailItem(email: email)
            items.append(emailItem)
        }
        
        let attributes = profile.profileAttributes
        if !attributes.isEmpty {
            let attributeItem = ProfileViewModelAttributeItem(attributes: attributes)
            items.append(attributeItem)
        }
        
        let friends = profile.friends
        if !friends.isEmpty {
            let friendsItem = ProfileViewModelFriendsItem(friends: friends)
            items.append(friendsItem)
        }
    }

}

extension ProfileViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .nameAndPicture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureTableViewCell.identifier, for: indexPath) as? NamePictureTableViewCell {
                cell.item = item
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.identifier, for: indexPath) as? AboutTableViewCell {
                cell.item = item
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailTableViewCell.identifier, for: indexPath) as? EmailTableViewCell {
                cell.item = item
                return cell
            }
        case .friends:
            if let item = item as? ProfileViewModelFriendsItem,
               let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell {
                let friend = item.friends[indexPath.row]
                cell.item = friend
                return cell
            }
        case .attribute:
            if let item = item as? ProfileViewModelAttributeItem,
               let cell = tableView.dequeueReusableCell(withIdentifier: AttributeTableViewCell.identifier, for: indexPath) as? AttributeTableViewCell {
                cell.item = item.attributes[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
    
}

class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    
    var sectionTitle: String {
        return "Main Info"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}

class ProfileViewModelAboutItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .about
    }
    
    var sectionTitle: String {
        return "About"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class ProfileViewModelEmailItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .email
    }
    
    var sectionTitle: String {
        return "Email"
    }
    
    var rowCount: Int {
        return 1
    }
    var email: String
    
    init(email: String) {
        self.email = email
    }
}

class ProfileViewModelAttributeItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .attribute
    }
    
    var sectionTitle: String {
        return "Attribute"
    }
    
    var rowCount: Int {
        return attributes.count
    }
    
    var attributes: [Attribute]
    
    init(attributes: [Attribute]) {
        self.attributes = attributes
    }
}

class ProfileViewModelFriendsItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .friends
    }
    
    var sectionTitle: String {
        return "Friends"
    }
    
    var rowCount: Int {
        return friends.count
    }
    
    var friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}
