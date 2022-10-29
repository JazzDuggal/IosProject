import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var list:Shopping;
    @State var name:String = "";
    @State var cardNum:String = "";
    @State var cvv:String = "";
    @State var selectedDate = Date();
    @State var zip:String = "";
    
    var body: some View{
        
        VStack{
            Header(heading: "   Checkout");
            
            CustomDivider(color: .purple, height: 2);
            
            Form{
                TextField("Enter CardHolder Name", text: $name)
                TextField("Enter Card Number", text: $cardNum)
                DatePicker("Expiration Date", selection: $selectedDate, displayedComponents: .date)
                TextField("Enter Security Code", text: $cvv)
                TextField("Enter Zip Code", text: $zip)
            }
            
            CustomDivider(color: .purple, height: 2);
            
            Button("Place Order    "){
                list.appState = 5;
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            
            Button("Go Back to Cart    "){
                list.appState = 3;
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            
            
        }
        Spacer()
    }
}




