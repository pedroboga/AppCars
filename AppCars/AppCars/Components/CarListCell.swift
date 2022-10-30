//
//  CarListCell.swift
//  AppCars
//
//  Created by Pedro Boga on 29/10/22.
//

import SwiftUI

struct CarListCell: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 250)
            Spacer()
            Text("Teste")
                .padding()
        }
        .frame(height: 150)
    }
}

struct CarListCell_Previews: PreviewProvider {
    static var previews: some View {
        CarListCell()
            .previewLayout(.sizeThatFits)
    }
}
