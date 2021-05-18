//
//  ContentView.swift
//  new bike same position
//
//  Created by Arne Eschenbruch on 25.04.21.
//

import SwiftUI

struct ContentView: View {
    //mit dem Trick die Variable "beinlaenge" auf "0" zu setzen umgehen wir, dass die Berechnung sich aufhängt. Eleganter wäre ein "optional" mit "nil", schneller geht es so.
    @State private var beinlaengeText: String = "0"
    //@State private var konstanteText: String = ""
    @State private var sattelhoehe: Double = 0
    
    var body: some View {
        VStack{
            // im Folgenden wird ein Image eingefügt. Die entsprechende Bilddatei muss im Projectnavigator, Ordner "Assets.xcassets" eingefügt werden. Der Bezug im code "Image" muss identisch mit dem Namen des Bildes im Ordner sein. Anschließend wird das Bild auf die gewünschte Größe und Form skaliert.
            Image("Titelbild newbikesameposition.001")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:300)
            
            Text("Sattelhöhenberechnung nach der Hügi-Methode")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack{
            //im Folgenden müssen wir noch die Größen und Abstände anpassen. Außerdem sollte farblich hervorgehoben werden, wo etwas einzutragen ist
                Text ("Innenbeinlänge =")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
            TextField("Innenbeinlänge in mm", text: $beinlaengeText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.white)
                .frame(width: 60, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            Text ("[mm]")
                .font(.footnote)
                .fontWeight(.light)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            }
            
            //Im Folgenden stand noch ein weiteres Textfield. Ist ausgegraut, weil aktuell nicht nötig.
            //TextField("Konstante", text: $konstanteText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 240.0, height: 30.0)
                .cornerRadius(5)
                .border(Color.black)
                
                
            
            Button(action:{
                let beinlaenge = Double(self.beinlaengeText)!
                //let konstante = Double(self.konstanteText)!
                //Hügi-Konstante 0.885
                self.sattelhoehe = beinlaenge*0.885

                
            }){
                Text("berechne die vorläufige Sattelhöhe")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .frame(width: 240.0, height: 30.0)
                    .background(Color.gray)
                    .cornerRadius(5)
            }
            
            
            //in Folgenden die Ausgabe des berechneten Wertes für die Sattelhöhe. Ausgegeben mit der Anzahl Nachkommastellen, die mit %.nf angegeben ist.
            Text("stelle die Sattelhöhe zunächst auf \(sattelhoehe, specifier: "%.0f")mm ein und fahre einige Kilometer")                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
