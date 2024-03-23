//
//  LaunchRootView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import SwiftUI

struct LaunchRootView: View {
    
    let viewModel: LaunchRootViewModel
    
    var body: some View {
        Image(.launhBackground)
            .resizable()
            .ignoresSafeArea()
            .onAppear{
                viewModel.viewDidAppear()
            }
    }
}
