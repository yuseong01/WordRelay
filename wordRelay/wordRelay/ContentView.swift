//
//  ContentView.swift
//  wordRelay
//
//  Created by yuseong on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    let title = "끝말잇기 게임"
    @State var nextWord: String = ""    //View한테 상태가 갱신될 거라는 걸 알려주는 @State(계속 다시 그려줘)
    @State var words: [String] = ["물컵", "컵받침", "침착맨"]
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
                .padding(.vertical,16) //상하
                .padding(.horizontal,20) //좌우
    //            .padding()
    //            .padding(.top,16)
    //            .padding(.bottom,16)
    //            .padding(.leading, 20)
    //            .padding(.trailing,20)
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(Color.teal)
                    .opacity(0.2)
                    .shadow(radius: 5)
            )
        }
        .padding(.top,10)
        HStack {
            TextField("단어를 입력하세요", text: $nextWord)//내가 View에서 수정할때 $기호를 붙여야함
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
            )
            
            Button(action: {
                //동작
                print("입력하신단어는 : ", nextWord)
                
                if words.last?.last == nextWord.first{
                    words.append(nextWord)
                    nextWord=""
                } else {
                    showAlert = true
                    nextWord=""
                }
                
                
                
            }, label: {
                //뷰
                Text("확인")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                    .padding(.vertical,12)
                    .background(RoundedRectangle(cornerRadius: 10)
                    )
            })
            .alert("틀렸지롱 메롱", isPresented: $showAlert) {
                Button("확인", role: .cancel) {
                    showAlert = false
                }
            }
            
        }
        
        .padding(.horizontal)
        .padding(.top)
        
        
        List{
            ForEach(words.reversed(), id: \.self) { word in
                Text(word)
                    .font(.title2)
            }
        }
        .listStyle(.plain)
        
        Spacer()
            
    }
}

#Preview {
    ContentView()
}
