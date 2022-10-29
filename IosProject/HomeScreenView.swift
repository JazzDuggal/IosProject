import SwiftUI
import SpriteKit

class GameScene: SKScene {
    

    let foodTexture1 = SKTexture(imageNamed: "pizza");
    let foodTexture2 = SKTexture(imageNamed: "cake");
    let foodTexture3 = SKTexture(imageNamed: "burger");
    let foodTexture4 = SKTexture(imageNamed: "nachos");
    let foodTexture5 = SKTexture(imageNamed: "icecream");
    let foodTexture6 = SKTexture(imageNamed: "juice");
    
    let food:SKSpriteNode = SKSpriteNode(imageNamed: "pizza");
    
    override func sceneDidLoad() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame);
        
        let texturesArray:Array<SKTexture> = [foodTexture1, foodTexture2, foodTexture3, foodTexture4, foodTexture5, foodTexture6];
        
        food.texture = foodTexture1;
        food.position = CGPoint(x:155, y:205);
        
        addChild(food);
        food.run(SKAction.repeatForever(SKAction.animate(with: texturesArray, timePerFrame: 1.2)));
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        food.run(SKAction.move(to: location, duration: 2))
        }
}

struct HomeScreenView: View {
    @EnvironmentObject var list:Shopping;
    @State var name:String = "";
    
    
    
    
    var scene:SKScene {
            let scene = GameScene();
        scene.scaleMode = .resizeFill;
        scene.backgroundColor = SKColor(.white)

            return scene;
    }
    
    init(){
        
    }
    
    var body: some View {
        VStack {
            
            Header(heading: "   Fast Food")
            CustomDivider(color: .purple,height:2)
            SpriteView(scene: scene);
            CustomDivider(color: .purple,height:2)
            Button("Online Order    "){
                
                list.appState = 1;
            }.foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
            
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
            Image("burger").resizable()
                .frame(width: 64, height: 64)
            Text("\(heading)").foregroundColor(.white)
                .font(.title)
        }.frame(minWidth: 64, idealWidth: 64, maxWidth: .infinity, minHeight: 64, idealHeight: 64, maxHeight: 64, alignment: .topLeading).background(.purple)
    }
}


