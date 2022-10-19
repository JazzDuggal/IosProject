import SwiftUI

struct CartView: View {
    @EnvironmentObject var list:Shopping;
    
    
    var body: some View{
        
        VStack{
            Header(heading: "Products");
            
            CustomDivider(color: .purple, height: 2);
            
            ForEach(list.productList, id: \.self){product in
                Text(product)
            }
            
            
            CustomDivider(color: .purple, height: 2);
            
            
            Button("Checkout Cart    "){
                
            }
            .foregroundColor(.purple).border(.white)
            .font(.title2).padding()
            
            Button("Add more Products    "){
                list.appState = 2;
            }
            .foregroundColor(.purple).border(.white)
            .font(.title2).padding()
            
            
        }
        Spacer()
    }
}



