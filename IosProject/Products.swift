import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var list:Shopping;
    @State var selectedProduct:Types;
    
    enum Types:String, CaseIterable, Identifiable{
        case general;
        case kitchen;
        case garage;
        case laundry;
        case milk;
        case eggs;
        var id:Self{self}
    }
    
    init(){
        selectedProduct = Types.general;
    }
    
    var body: some View{
        VStack{
            Header(heading: "Products")
            CustomDivider(color: .purple, height: 2)
            
            HStack{
                Text("Products").foregroundColor(.purple)
                Picker(selection: $selectedProduct, label: Text("category")) {
                    ForEach(Types.allCases){ type in
                        Text(type.rawValue.capitalized);
                    }
                }.pickerStyle(.wheel).colorMultiply(.purple)
                
            }
            CustomDivider(color: .purple, height: 2)
            
            Button("Add to Cart    "){
                list.productList.append(selectedProduct.rawValue)
            }
            .foregroundColor(.purple).border(.white)
            .font(.title2).padding()
            
            Button("View Cart    "){
                list.appState = 3;
            }
            .foregroundColor(.purple).border(.white)
            .font(.title2).padding()
            
            
        }
        Spacer()
    }
}

