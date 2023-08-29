//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Omer on 29.08.2023.
//

import Foundation

class UserListViewModel:ObservableObject{
    @Published var userList = [UserViewModel]()
    
    let webService = WebService()
    
    func downloadUsers() async {
         
        do{
            let users = try await webService.download(Constants.Urls.usersExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch{
            print("Error")
        }
    }
}


struct UserViewModel {
    let user: User
    
    
    var Id:Int{
        user.id
    }
    
    var name:String {
        user.name
    }
    var userName:String {
        user.username
    }
    
    var email:String{
        user.email
    }
}
