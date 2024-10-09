//
//  DessertCell.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI
import struct Commons.CustomWebImage
import struct CoreKit.DessertPresentable

struct DessertCell: View {
    
    // MARK: - Properties
    
    let width: CGFloat
    let dessert: DessertPresentable
    
    // MARK: - CodeView
    
    var body: some View {
        CustomWebImage(url: dessert.imageUrl, fixedSize: CGSize(width: width, height: 200), placeholder: {
            Image(.launchBackground)
                .resizable()
        })
        .frame(width: width, height: 200)
        .overlay {
            VStack(alignment: .leading) {
                Spacer()
                Text(dessert.name)
                    .foregroundStyle(.white)
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding([.bottom, .leading], 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
            }

        }
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .background{
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(
                    color: .black.opacity(0.1), radius: 2, x: 0, y: 3)
        }
    }
}
