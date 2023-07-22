//
//  FruitCardView.swift
//  Fructus
//
//  Created by Artem Talko on 20.07.2023.
//

import SwiftUI

struct FruitCardView: View {
	//MARK: - PROPERTIES
	@State private var isAnimating: Bool = false
	var fruit: Fruit
	//MARK: - BODY
	
	
    var body: some View {
			ZStack {
				VStack(spacing: 20) {
					//FRUIT: IMAGE
					Image(fruit.image)
						.resizable()
						.scaledToFit()
						.shadow(color: .gray.opacity(0.3), radius: 5, x: 6, y: 8)
						.scaleEffect(isAnimating ? 1 : 0.6)
					
					
					//FRUIT: TITLE
					Text(fruit.title)
						.foregroundColor(.white)
						.font(.largeTitle)
						.fontWeight(.heavy)
						.shadow(color: .gray.opacity(0.25), radius: 2, x: 2, y: 2)
					
					//FRUIT: HEADLINE
					Text(fruit.headline)
						.foregroundColor(.white)
						.multilineTextAlignment(.center)
						.padding(.horizontal, 16)
						.frame(maxWidth: 480)
					
					//BUTTON: START
					StartButtonView()
					
				}//: VSTACK
			}//: ZSTACK
			.onAppear {
				withAnimation(.easeInOut(duration: 0.5)) {
					isAnimating = true
				}
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
			.background(
				.linearGradient(Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom)
			)
			.cornerRadius(20)
			.padding(.horizontal, 20)
    }
}

//MARK: - PREVIEW
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
			FruitCardView(fruit: fruitData[1])
				.previewLayout(.fixed(width: 320, height: 640))
    }
}