//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Omer on 26.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var userListViewModel:UserListViewModel
    
    
    init() {
        self.userListViewModel = UserListViewModel()
    }
    var body: some View {
       
        List(userListViewModel.userList,id: \.Id){
            user in
            VStack
            {
                Text(user.name)
                Text(user.email)
                Text(user.userName)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
