import SwiftUI

struct SidesView: View {
    
    @EnvironmentObject var list:Shopping;
    @State var selectedProduct:Types;
    @State var showingAlert = false;
    @State var message = "";
    
    enum Types:String, CaseIterable, Identifiable{
        case cFudge     = "Choclate Fudge   $5";
        case Fries      = "Large Fries      $3";
        case mFries     = "Medium Fries     $2";
        case macCheese  = "Mac n Cheese     $5";
        case Chips      = "Potato Chips     $2";
        
        var id:Self{self}
    }
    
    init(){
        selectedProduct = Types.mFries;
    }
    
    var body: some View{
        VStack{
            Header(heading: "   Menu")
            CustomDivider(color: .purple, height: 2)
            HStack{
                Button("Burgers"){
                    list.appState = 2;
                }
                .foregroundColor(.black)
                .font(.caption)
                    .padding()
                    .background(Color.yellow.cornerRadius(18))
                Button("Beverages"){
                    list.appState = 7;
                }
                .foregroundColor(.black)
                    .font(.caption)
                    .padding()
                    .background(Color.yellow.cornerRadius(18))
                Button("Sides"){
                    list.appState = 8;
                }
                .foregroundColor(.black)
                    .font(.title2)
                    .padding()
                    .background(Color.yellow.cornerRadius(18))
            }
            CustomDivider(color: .purple, height: 2)
            HStack{
                Picker(selection: $selectedProduct, label: Text("category")) {
                    ForEach(Types.allCases){ type in
                        Text(type.rawValue.capitalized);
                    }
                }.pickerStyle(.inline)
            
                
            }.frame(height: 260)
            CustomDivider(color: .purple, height: 2)
            HStack{
            Button("Add to Cart    "){
                list.productList.append(selectedProduct.rawValue)
                
                switch selectedProduct {
                case .cFudge:
                    showingAlert = true;
                    message = "Choclate Fudge added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Fries:
                    showingAlert = true;
                    message = "Large Fries added to Cart.";
                    list.totalAmount+=3;
                    break;
                case .mFries:
                    showingAlert = true;
                    message = "Medium Fries added to Cart.";
                    list.totalAmount+=2;
                    break;
                case .macCheese:
                    showingAlert = true;
                    message = "Mac n Cheese added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Chips:
                    showingAlert = true;
                    message = "Potato Chips added to Cart.";
                    list.totalAmount+=2;
                    break;                }
            }.alert(message, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            
            Button("View Cart    "){
                list.appState = 3;
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            }
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



