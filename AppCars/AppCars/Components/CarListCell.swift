//
//  CarListCell.swift
//  AppCars
//
//  Created by Pedro Boga on 29/10/22.
//

import SwiftUI

struct CarListCell: View {
    var car: Car
    var body: some View {
        HStack {
            CarRemoteImage(urlString: car.urlFoto ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 150)
            Spacer()
            Text(car.nome ?? "")
                .padding()
        }
        .background(Color(.systemBackground).cornerRadius(8).shadow(color: .primary.opacity(0.3), radius: 5, x: 0, y: 2))
        .frame(height: 150)
        
    }
}

struct CarListCell_Previews: PreviewProvider {
    static var previews: some View {
        CarListCell(car: MockData.sampleCar)
            .previewLayout(.sizeThatFits)
    }
}
