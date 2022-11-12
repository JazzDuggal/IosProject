import SwiftUI

class Shopping: ObservableObject{
    @Published var appState:Int;
    @Published var listName:String?
    @Published var category:String?
    @Published var productList:Array<String> = [];
    @Published var userName:String = "";
    @Published var totalAmount:Double = 0;
    
    enum products:String, CaseIterable, Identifiable{
        case general;
        case kitchen;
        case garage;
        case laundry;
        case milk;
        case eggs;
        var id:Self{self}
    }
    
    init(appState:Int)
    {
        self.appState = appState;
    }
}


@main
struct ShoppingApp: App {
    @ObservedObject var list:Shopping = Shopping(appState: 0);
    
    var body: some Scene {
        WindowGroup {
            
            if(list.appState == 0){
                HomeScreenView().environmentObject(list);
            }
            else if(list.appState == 1){
                UserRegisterView().environmentObject(list);
            }
            else if(list.appState == 2){
                ProductsView().environmentObject(list);
            }
            else if(list.appState == 3){
                CartView().environmentObject(list);
            }
            else if(list.appState == 4){
                CheckoutView().environmentObject(list);
            }
            else if(list.appState == 5){
                OrderNumberView().environmentObject(list);
            }
            
        }
    }
}

