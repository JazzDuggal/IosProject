import SwiftUI

struct BeveragesView: View {
    
    @EnvironmentObject var list:Shopping;
    @State var selectedProduct:Types;
    @State var showingAlert = false;
    @State var message = "";
    
    enum Types:String, CaseIterable, Identifiable{
        case Coke       = "Coke             $1";
        case Dew        = "Mountain Dew     $1";
        case Juice      = "Orange Juice     $2";
        case Grape      = "Grape Juice      $2";
        case Coffee     = "Regular Coffee   $3";
        case icedCoffee = "Ice Coffee       $3";
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
                    .font(.title2)
                    .padding()
                    .background(Color.yellow.cornerRadius(18))
                Button("Sides"){
                    list.appState = 8;
                }
                .foregroundColor(.black)
                    .font(.caption)
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
                case .Juice:
                    showingAlert = true;
                    message = "Orange Juice added to Cart.";
                    list.totalAmount+=2;
                    break;
                case .Dew:
                    showingAlert = true;
                    message = "Mountain Dew added to Cart.";
                    list.totalAmount+=1;
                    break;
                case .Coke:
                    showingAlert = true;
                    message = "Coke added to Cart.";
                    list.totalAmount+=1;
                    break;
                case .Coffee:
                    showingAlert = true;
                    message = "Regular Coffee added to Cart.";
                    list.totalAmount+=3;
                    break;
                case .icedCoffee:
                    showingAlert = true;
                    message = "Ice Coffee added to Cart.";
                    list.totalAmount+=3;
                    break;
                case .Grape:
                    showingAlert = true;
                    message = "Grape Juice added to Cart.";
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


