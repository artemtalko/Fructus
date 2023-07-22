//
//  FruitRowView.swift
//  Fructus
//
//  Created by Artem Talko on 21.07.2023.
//

import SwiftUI

struct FruitRowView: View {
	//MARK: - PROPERTIES
	var fruit: Fruit
	
	//MARK: - BODY
    var body: some View {
			HStack {
				Image(fruit.image)
					.renderingMode(.original)
					.resizable()
					.scaledToFit()
					.frame(width: 80, height: 80, alignment: .center)
					.shadow(radius: 5)
					.background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
					.cornerRadius(8)
				
				VStack(alignment: .leading, spacing: 5) {
					Text(fruit.title)
						.font(.title2)
						.fontWeight(.bold)
					Text(fruit.headline)
						.font(.caption)
						.foregroundColor(Color.secondary)
				}
			}//: HSTACK
    }
}

//MARK: - PREVIEW
struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
			FruitRowView(fruit: fruitData[0])
				.previewLayout(.sizeThatFits)
				.padding()
    }
}
