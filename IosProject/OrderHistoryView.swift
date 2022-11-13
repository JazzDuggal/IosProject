import SwiftUI

struct OrderHistoryView: View {
    @EnvironmentObject var list:Shopping;
    
    
    var body: some View{
        
        VStack{
            Header(heading: "Order History");
            
            CustomDivider(color: .purple, height: 2);
            
            Form{
                
                ForEach(list.orderHistory, id: \.self){product in
                    Text("Previous Order: \(product)\n");
                    }
               
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





