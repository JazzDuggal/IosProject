import SwiftUI

struct CartView: View {
    @EnvironmentObject var list:Shopping;
    
    
    var body: some View{
        
        VStack{
            Header(heading: "   Items");
            
            CustomDivider(color: .purple, height: 2);
            VStack{
            ForEach(list.productList, id: \.self){product in
                Text(product)
            }
            }.frame(height: 300)
            
            
            CustomDivider(color: .purple, height: 2);
            
            
            Button("Checkout Cart    "){
                list.appState = 4;
                
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            
            Button("Add more Products    "){
                list.appState = 2;
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            
            
        }
        Spacer()
    }
}



