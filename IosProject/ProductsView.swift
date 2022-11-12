import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var list:Shopping;
    @State var selectedProduct:Types;
    @State var showingAlert = false;
    @State var message = "";
    
    enum Types:String, CaseIterable, Identifiable{
        case Burger     = "Burger           $5";
        case Pizza      = "Pizza            $10";
        case Juice      = "Orange Juice     $2";
        case Cake       = "Choclate Fudge   $5";
        case IceCream   = "Choc. IceCream   $5";
        case Soda       = "Cream Soda       $2";
        var id:Self{self}
    }
    
    init(){
        selectedProduct = Types.Juice;
    }
    
    var body: some View{
        VStack{
            Header(heading: "   Menu")
            CustomDivider(color: .purple, height: 2)
            
            HStack{
                Picker(selection: $selectedProduct, label: Text("category")) {
                    ForEach(Types.allCases){ type in
                        Text(type.rawValue.capitalized);
                    }
                }.pickerStyle(.inline)
                    
                
            }.frame(height: 300)
            CustomDivider(color: .purple, height: 2)
            
            Button("Add to Cart    "){
                list.productList.append(selectedProduct.rawValue)
                
                switch selectedProduct {
                case .Juice:
                    showingAlert = true;
                    message = "Juice added to Cart.";
                    list.totalAmount+=2;
                    break;
                case .Burger:
                    showingAlert = true;
                    message = "Burger added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Pizza:
                    showingAlert = true;
                    message = "Pizza added to Cart.";
                    list.totalAmount+=10;
                    break;
                case .Cake:
                    showingAlert = true;
                    message = "Choclate Fudge added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .IceCream:
                    showingAlert = true;
                    message = "Choclate Ice Cream added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Soda:
                    showingAlert = true;
                    message = "Cream Soda added to Cart.";
                    list.totalAmount+=2;
                    break;
                }
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
        Spacer()
    }
}

