import SwiftUI

struct OrderNumberView: View {
    @EnvironmentObject var list:Shopping;
    
    
    var body: some View{
        
        VStack{
            Header(heading: "Order Confirmation");
            
            CustomDivider(color: .purple, height: 2);
            
            Form{
                Text("Order Number: ")
               
            }
            
            CustomDivider(color: .purple, height: 2);
            
            Button("Home    "){
                list.appState = 0;
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            
            
            
        }
        Spacer()
    }
}





