//
//  ContentView.swift
//  FinanceApp
//
//  Created by Mehdi Oturak on 24.09.2024.
//

import SwiftUI
import CoreData
import Charts

struct ContentView: View {
    

    var body: some View {
        
        VStack(spacing: 25) {
            HomeHeader()
            generateChart()
            showBottomView()
        }
        .padding()
    }

    @ViewBuilder
    private func HomeHeader() -> some View {
        HStack(alignment: .top) {
            Grid {
                GridRow {
                    Circle()
                        .frame(width: 3, height: 3)
                    Circle()
                        .frame(width: 3, height: 3)
                }
                GridRow {
                    Circle()
                        .frame(width: 3, height: 3)
                    Circle()
                        .frame(width: 3, height: 3)
                }
            }
            Spacer()
            Image("myphoto")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray.opacity(0.3), lineWidth: 1)
                }
        }
    }
    @ViewBuilder
    private func generateChart() -> some View {
        Chart {
            ForEach(ChartData.exampleData) { data in
                BarMark(x: .value("Goal", data.goalTitle),
                        y: .value("Sale", data.goalPercentage))
                .foregroundStyle(Color.green.gradient.opacity(CGFloat(data.goalPercentage) * 0.01))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .annotation {
                    Text("\(data.goalPercentage)%")
                        .font(.caption)
                        .padding(3)
                }
            }
        }
        .padding()
        .chartYScale(domain: 20...80)
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
        .padding()
        .frame(height: UIScreen.main.bounds.height * 0.2)
    }
    @ViewBuilder
    private func chartSelector() -> some View {
        VStack(alignment: .center, spacing: 15) {
            Image(systemName: "percent")
            Text("230K")
                .font(.title3)
                .fontWeight(.heavy)
            Text("Sales")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.gray.opacity(0.1)
                .cornerRadius(40)
        }
        
    }
    
    @ViewBuilder
    private func createChartSelectorGrid() -> some View {
        HStack(spacing: 30) {
            VStack(spacing: 30) {
                chartSelector()
                    .frame(height: 170)
                chartSelector()
                    .frame(height: 200)
            }
            VStack(spacing: 30) {
                chartSelector()
                    .frame(height: 200)
                chartSelector()
                    .frame(height: 170)
            }
        }
    }
    
    @ViewBuilder
    private func showBottomView() -> some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("Total Sales")
                .font(.title3.bold())
            createChartSelectorGrid()
        }
    }
}

#Preview {
    ContentView()
}
