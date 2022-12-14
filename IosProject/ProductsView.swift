import SwiftUI

struct ProductsView: View {
    
    @EnvironmentObject var list:Shopping;
    @State var selectedProduct:Types;
    @State var showingAlert = false;
    @State var message = "";
    
    enum Types:String, CaseIterable, Identifiable{
        case Burger1     = "Ham Burger              $5";
        case Burger2     = "Bacon Cheese Burger     $5";
        case Burger3     = "Cheese Burger           $5";
        case Burger4     = "Double Cheese Burger    $5";
        case Burger5     = "Ham & Cheese Burger     $5";
        case Burger6     = "Mac & Cheese Burger     $5";
        case Burger7     = "Skyscraper Burger       $5";
        
        var id:Self{self}
    }
    
    init(){
        selectedProduct = Types.Burger4;
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
                    .font(.title2)
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
                
                case .Burger1:
                    showingAlert = true;
                    message = "Ham Burger added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Burger2:
                    showingAlert = true;
                    message = "Bacon Cheese Burger added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Burger3:
                    showingAlert = true;
                    message = "Cheese Burger added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Burger4:
                    showingAlert = true;
                    message = "Double Cheese Burger added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Burger5:
                    showingAlert = true;
                    message = "Ham & Cheese Burger added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Burger6:
                    showingAlert = true;
                    message = "Mac & Cheese Burger added to Cart.";
                    list.totalAmount+=5;
                    break;
                case .Burger7:
                    showingAlert = true;
                    message = "SkyScraper Burger added to Cart.";
                    list.totalAmount+=5;
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

