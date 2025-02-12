//
//  ShapeView.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 12.02.2025.
//

import SwiftUI

struct ShapeView: View {
    
    var body: some View {
        content
    }
}

private extension ShapeView {
    
    var content: some View {
        ScrollView {
            VStack(spacing: 30) {
                stock
                custom
            }
        }
    }
    
    var stock: some View {
        VStack(spacing: 12) {
            Text("Built-in Shapes")
                .font(.title)
                .frame(maxWidth: .infinity)
            
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
            Ellipse()
                .fill(.pink)
                .frame(width: 200, height: 120)
            Rectangle()
                .fill(.cyan)
                .frame(width: 200, height: 150)
            RoundedRectangle(cornerRadius: 12)
                .fill(.gray)
                .frame(width: 200, height: 100)
            Capsule()
                .fill(.blue)
                .frame(width: 180, height: 60)
        }
    }
    
    var custom: some View {
        VStack(spacing: 12) {
            Text("Custom Shapes")
                .font(.title)
                
            Triangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
            
            ZStack {
                Square()
                    .stroke(Color.red, lineWidth: 1)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(45))
                Square()
                    .stroke(Color.blue, lineWidth: 1)
                    .frame(width: 200, height: 200)
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.width - 64)
            
            HStack {
                Star()
                    .fill(.yellow)
                    .frame(width: 120, height: 120)
                
                RoundedStar(cornerRadius: 0.2)
                    .fill(.yellow)
                    .frame(width: 120, height: 120)
            }
        }
    }
}

#Preview {
    ShapeView()
}
