//
//  GuessingNationalFlagGame.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/12.
//

import SwiftUI

struct GuessingNationalFlagGame: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var tipInfo = ""
    @State private var score = 0
    @State private var count = 0
    
    var body: some View {
        
        ZStack {
//            LinearGradient(colors: [.blue,.black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("猜国旗")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                
                Text("得分：\(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button(action:{
                            flagTapped(number)
                        }, label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore, actions: {
            Button("继续", action: askQuestion)
        }, message: {
            Text(tipInfo)
        })

    }
    
    func flagTapped(_ number: Int){
        if count == 7 {
            // 8次一轮，游戏结束
            scoreTitle = "游戏结束"
            tipInfo = "要重新开始吗？"
            count = 0
            score = 0
        } else {
            if number == correctAnswer {
                score+=1
                scoreTitle = "正确"
                tipInfo = "得分\(score)"
            } else {
                scoreTitle = "错误"
                tipInfo = "错了，那是\(countries[number])国旗"
            }
        }

        count += 1
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    GuessingNationalFlagGame()
}
