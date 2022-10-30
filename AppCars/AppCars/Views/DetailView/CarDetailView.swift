//
//  CarDetailView.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            CarRemoteImage(urlString: car.urlFoto ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(car.nome ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(car.descricao ?? "")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            DismissButton()
        }), alignment: .topTrailing)
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(car: MockData.sampleCar, isShowingDetail: .constant(false))
    }
}
