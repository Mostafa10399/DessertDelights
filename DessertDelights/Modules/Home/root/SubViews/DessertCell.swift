//
//  DessertCell.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

struct DessertCell: View {
    
    // MARK: - Properties
    
    let width: CGFloat
    
    // MARK: - CodeView
    
    var body: some View {
        AsyncImage(url: URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")) { image in
            image
                .resizable()
        } placeholder: {
            ProgressView()
                
        }
        .frame(width: width, height: 200)
        .overlay {
            VStack(alignment: .leading) {
                Spacer()
                Text("Apam balik")
                    .foregroundStyle(.white)
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .padding([.bottom, .leading], 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .shadow(radius: 10)
            }

        }
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .shadow(radius: 2)
    }
}

#Preview {
    DessertCell(width: 200)
}
