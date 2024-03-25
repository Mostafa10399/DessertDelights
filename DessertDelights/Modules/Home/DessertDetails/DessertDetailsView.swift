//
//  DessertDetailsView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

struct DessertDetailsView: View {
    var body: some View {
        GeometryReader(content: { geo in
            ScrollView(showsIndicators: false, content: {
                LazyVStack {
                    AsyncImage(url: URL(string: "https://www.themealdb.com/images/media/meals/6ut2og1619790195.jpg"), transaction: .init(animation: .bouncy(duration: 1)), content: { imageState in
                        switch imageState {
                        case .empty:
                             ZStack {
                                 Color.gray
                                     .opacity(0.4)
                                 ProgressView()
                             }
                        case .success(let image):
                                            image.resizable()
                        case .failure(let error):
                                            Text(error.localizedDescription)
                        @unknown default:
                            EmptyView()
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height * 0.35)
                    
                    Group {
                        HStack(content: {
                            Image(systemName: "map.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.accent)
                                Text("Malaysian")
                                .font(.custom("Poppins-Regular", size: 14))
                            Spacer()
                        })
                        Text("In a blender, add the ingredients for the spice paste and blend until smooth.\r\nOver medium heat, pour the spice paste in a skillet or pan and fry for 10 minutes until fragrant. Add water or oil 1 tablespoon at a time if the paste becomes too dry. Don't burn the paste. Lower the fire slightly if needed.\r\nAdd the cloves, cardamom, tamarind pulp, coconut milk, water, sugar and salt. Turn the heat up and bring the mixture to boil. Turn the heat to medium low and simmer for 10 minutes. Stir occasionally. It will reduce slightly. This is the marinade/sauce, so taste and adjust seasoning if necessary. Don't worry if it's slightly bitter. It will go away when roasting.\r\nWhen the marinade/sauce has cooled, pour everything over the chicken and marinate overnight to two days.\r\nPreheat the oven to 425 F.\r\nRemove the chicken from the marinade. Spoon the marinade onto a greased (or aluminum lined) baking sheet. Lay the chicken on top of the sauce (make sure the chicken covers the sauce and the sauce isn't exposed or it'll burn) and spread the remaining marinade on the chicken. Roast for 35-45 minutes or until internal temp of the thickest part of chicken is at least 175 F.\r\nLet chicken rest for 5 minutes. Brush the chicken with some of the oil. Serve chicken with the sauce over steamed rice (or coconut rice).")
                            .font(.custom("Poppins-Regular", size: 13))
                            .foregroundStyle(.secondary)
                        Text("Ingredients & Measurements")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom("Poppins-Bold", size: 18))
                            .foregroundStyle(.black1)
                        ForEach(0..<5) { indeie in
                            HStack {
                                Circle()
                                    .fill(Color(.accent))
                                    .frame(width: 5, height: 5)
                                Text("Chicken Thighs: 6")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.custom("Poppins-Regular", size: 13))
                                    .foregroundStyle(.secondary)
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.horizontal, 12)
                        
                }
                .padding(.bottom)
            })
        })
        .navigationTitle("Ayam Percik")
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    DessertDetailsView()
}
