//
//  TriviaView.swift
//  QuizProject
//
//  Created by cys on 2023/08/09.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 40){
                Image("main")
                
                Text("퀴즈가 끝났습니다!")
                    .font(.system(size: 20))
                
                Text("당신의 점수는")
                Text("\(triviaManager.score)점")
                    .font(.system(size: 30))
                
                Button{
                    Task.init{
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "다시하기")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
