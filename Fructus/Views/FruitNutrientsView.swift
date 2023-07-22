//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Artem Talko on 22.07.2023.
//

import SwiftUI

struct FruitNutrientsView: View {
	
	var fruit: Fruit
	let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
	
    var body: some View {
			GroupBox() {
				DisclosureGroup("Nutritional value per 100g"){
					ForEach(0..<nutrients.count, id: \.self) { item in
						Divider().padding(.vertical, 2)
						HStack {
							Group {
								Image(systemName: "info.circle")
								Text(nutrients[item])
							}
							.foregroundColor(fruit.gradientColors[1])
							.font(Font.system(.body).bold())
							Spacer()
							Text(fruit.nutrition[item])
								.multilineTextAlignment(.trailing)
						}
						.padding(.vertical, 12)
					}
				}
			}//: Box
    }
}

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitData[0])
				.previewLayout(.fixed(width: 375, height: 480))
				.padding()
    }
}
