import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var list:Shopping;
    @State var selectedProduct:Types;
    
    enum Types:String, CaseIterable, Identifiable{
        case Burger;
        case Pizza;
        case Juice;
        case Cake;
        case IceCream;
        case Soda;
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

