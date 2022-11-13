import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var list:Shopping;
    @State var name:String = "";
    @State var cardNum:String = "";
    @State var cvv:String = "";
    @State var selectedDate = Date();
    @State var zip:String = "";
    @State var showingAlert = false;
    @State var message:String = "";
    
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
                message = "";
                if(name == ""){
                    showingAlert = true;
                    message += "Enter CardHolder's Name.\n\n";
                }
                if((Double(cardNum) ?? 0) == 0){
                    showingAlert = true;
                    message += "Enter Valid Card Number.\n\n";
                }
                if(cardNum.count < 12 || cardNum.count > 16){
                    showingAlert = true;
                    message += "Enter 13-16digit Card Num.\n\n";
                }
                if((Double(cvv) ?? 0) == 0){
                    showingAlert = true;
                    message += "Enter Valid CVV Number.\n\n";
                }
                if(cvv.count != 3){
                    showingAlert = true;
                    message += "Enter 3digit CVV Number.\n\n";
                }
                if((Double(zip) ?? 0) == 0){
                    showingAlert = true;
                    message += "Enter Valid Zip Code.\n\n";
                }
                if(zip.count != 5){
                    showingAlert = true;
                    message += "Enter 5digit Zip Code.\n\n";
                }
                if(selectedDate < Date.now){
                    showingAlert = true;
                    message += "Select Valid Date.\n";
                }
                if(message==""){
                    let string:String = list.productList.joined(separator: ",");
                    list.orderHistory.append(string);
                    list.orderNumber+=1;
                    list.appState = 5;
                }
                
            }.alert(message, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
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




