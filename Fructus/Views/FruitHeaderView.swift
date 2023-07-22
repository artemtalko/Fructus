//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Artem Talko on 22.07.2023.
//

import SwiftUI

struct FruitHeaderView: View {
	//MARK: - PROPERTIES
	var fruit: Fruit
	@State private var isAnimatingImage: Bool = false
	
	//MARK: - BODY
    var body: some View {
			ZStack {
				LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
				
				Image(fruit.image)
					.resizable()
					.scaledToFit()
					.shadow(color: .gray.opacity(0.3), radius: 8, x: 6, y: 8)
					.padding(.vertical, 20)
					.scaleEffect(isAnimatingImage ? 1.0 : 0.6)
			}//: ZSTACK
			.frame(height: 440)
			.onAppear() {
				withAnimation(.easeInOut(duration: 0.5)) {
					isAnimatingImage = true
				}
			}
    }
}

//MARK: - PREVIEW
struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitData[0])
				.previewLayout(.fixed(width: 375, height: 440))
    }
}
