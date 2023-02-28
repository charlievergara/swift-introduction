//
//  ContentView.swift
//  CMemorize
//
//  Created by Carlos Alberto Vergara Marrugo on 1/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack{
            /*HStack{
                Text("Memorize!")
            }*/
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            //Spacer()
           /* HStack{
                Button(action: {
                    emojis = flags.shuffled()
                    emojiCount = emojis.count
                    
                }, label: {
                    VStack{
                        Image(systemName: "house.fill")
                        Text("FLAGS")
                            .font(.footnote)
                            .fontWeight(.light)
                    }
                    .font(.largeTitle)
                    
                })
                //remove
                Spacer()
                Button(action: {
                    emojis = hearts.shuffled()
                    emojiCount = emojis.count
                }, label: {
                    VStack{
                        Image(systemName: "heart.fill")
                        Text("HEARTS")
                            .font(.footnote)
                            .fontWeight(.light)
                            
                    }
                    .font(.largeTitle)
                })
                Spacer()
                Button(action: {
                    emojis = clothing.shuffled()
                    emojiCount = emojis.count
                }, label: {
                    VStack{
                        Image(systemName: "tshirt.fill")
                        Text("CLOTHING")
                            .font(.footnote)
                            .fontWeight(.light)
                    }
                    .font(.largeTitle)
                    
                })
                //add
                
            }
            //.font(.largeTitle)
            .padding(.horizontal)*/
            
        }
        .padding(.horizontal)
            
        
        
    }
    
    /*var add:some View{
        Button(action: {
            if emojiCount > 1{
                emojiCount += 1
            }
            
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var remove:some View{
        Button(action: {
            if(emojiCount < emojis.count){
                emojiCount -= 1
            }
            
        }, label: {
            Image(systemName: "minus.circle")
        })
    }*/
}

struct CardView: View{
    let card:MemoryGame<String>.Card
    
    var body: some View{
        ZStack(content: {
            
            let shape = RoundedRectangle(cornerRadius: 10)
            
            if card.isFaceUp{
                shape
                    .fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            }else{
                shape
                    .fill()
            }
            
        })
        /*.onTapGesture {
            card.isFaceUp = !card.isFaceUp
            
        }*/
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
