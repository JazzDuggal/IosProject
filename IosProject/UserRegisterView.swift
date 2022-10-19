import SwiftUI

struct UserRegisterView: View {
    @EnvironmentObject var list:Shopping;
    @State var userName:String = "";
    @State var pass:String = "";
    var body: some View{
        VStack{
            Header(heading: "User Register")
            CustomDivider(color: .purple, height: 2)
            
            VStack{
                HStack{
                    Label("User Name", systemImage: "").padding()
                    TextField("Enter User Name", text: $userName)
                }
                HStack{
                    Label("Password", systemImage: "").padding()
                    TextField("minimum 8 characters", text: $pass)
                }
            }.frame(height: 200, alignment: .topLeading)
            
            CustomDivider(color: .purple, height: 2)
            Button("Register    "){
                list.appState = 2
            }
                .foregroundColor(.purple).border(.white)
                .font(.title2)
                
                
        }
        Spacer()
    }
}


