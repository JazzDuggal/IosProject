import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var list:Shopping;
    @State var name:String = "";
    @State var selectedCategory:Types;
    
    enum Types:String, CaseIterable, Identifiable{
        case general;
        case kitchen;
        case garage;
        case laundry;
        var id:Self{self}
    }
    
    init(){
        selectedCategory = Types.general;
    }
    
    var body: some View {
        VStack {
            
            Header(heading: "Shopping App")
            CustomDivider(color: .purple,height:2)
            Image(systemName: "cart.fill").resizable()
            CustomDivider(color: .purple,height:2)
            Text("")
            Button("Register"){
                
                list.appState = 1;
            }.foregroundColor(.purple)
                .font(.title2)
            
        }
        Spacer()
    }
}

struct CustomDivider: View{
    var color:Color;
    var height:CGFloat;
    
    init(color:Color, height:CGFloat){
        self.color = color;
        self.height = height;
    }
    var body: some View{
        Rectangle().fill(color).frame(height: height).edgesIgnoringSafeArea(.horizontal)
    }
}

struct Header: View{
    var heading:String;
    
    init(heading:String){
        self.heading = heading;
    }
    var body: some View{
        HStack{
            Image("listIcon").resizable()
                .frame(width: 64, height: 64)
            Text("\(heading)").foregroundColor(.white)
                .font(.title)
        }.frame(minWidth: 64, idealWidth: 64, maxWidth: .infinity, minHeight: 64, idealHeight: 64, maxHeight: 64, alignment: .topLeading).background(.purple)
    }
}

