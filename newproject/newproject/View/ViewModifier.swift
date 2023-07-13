//
//  ViewModifier.swift
//  newproject
//
//  Created by New User on 7/9/23.
//

import SwiftUI
//MARK: - create properties
struct customModifier: ViewModifier{
    let backgroundColor: Color
    let foregroundColor: Color
    let strokeColor: Color
    let strokeWidth: CGFloat
    let cornerRadius: CGFloat
    let shadowRadius:CGFloat
    let font: Font
    let frame:(width:CGFloat,height:CGFloat,alignment:Alignment)
    let Maxframe:(minWidth: CGFloat, idealWidth:CGFloat, maxWidth: CGFloat, minHeight: CGFloat, idealHeight: CGFloat?, maxHeight: CGFloat, alignment: Alignment)
    let alignment: TextAlignment
    let lineLimit: Int?
    let opacity: CGFloat
    let offset: (x: CGFloat, y: CGFloat)
    let padding: (top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)
    
    
    func body(content: Content) -> some View {
        content
            .frame(width:frame.width, height:frame.height, alignment:frame.alignment)
        //.frame(minWidth: Maxframe.minWidth, idealWidth:Maxframe.idealWidth, maxWidth: Maxframe.maxWidth, minHeight: Maxframe.minHeight, idealHeight: Maxframe.idealHeight, maxHeight: Maxframe.maxHeight, alignment: Maxframe.alignment)
            .padding(.top, padding.top)
            .padding(.leading, padding.leading)
            .padding(.bottom, padding.bottom)
            .padding(.trailing, padding.trailing)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
            .font(font)
            .multilineTextAlignment(alignment)
            .lineLimit(lineLimit)
            .opacity(opacity)
            .offset(x: offset.x, y: offset.y)
            .fixedSize(horizontal: false, vertical: true)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(strokeColor, lineWidth: strokeWidth))
    }
}

//MARK:- create viewExtension

extension View {
    func customModifier (
        backgroundColor: Color = .clear,
        foregroundColor: Color = .black,
        strokeColor: Color = .clear,
        strokeWidth: CGFloat = 0,
        cornerRadius: CGFloat = 0,
        shadowRadius: CGFloat = 0,
        font: Font = .caption,
        frame:(width:CGFloat,height:CGFloat,alignment:Alignment) = (width:0,height:0,alignment:.center),
        maxframe:(minWidth: CGFloat, idealWidth:CGFloat, maxWidth: CGFloat, minHeight: CGFloat, idealHeight: CGFloat?, maxHeight: CGFloat, alignment: Alignment) = (minWidth: 0, idealWidth:0, maxWidth:0, minHeight:0, idealHeight:0, maxHeight: 0, alignment:.center),
        
        alignment: TextAlignment = .center,
        lineLimit: Int = 0,
        opacity: CGFloat = 1,
        offset: (x: CGFloat, y: CGFloat) = (x: 0, y: 0),
        padding: (
            top: CGFloat,
            leading: CGFloat,
            bottom: CGFloat,
            trailing: CGFloat) = (
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 0))-> some View {
                    
                    modifier(newproject.customModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, strokeColor: strokeColor, strokeWidth: strokeWidth, cornerRadius: cornerRadius,shadowRadius:shadowRadius, font:font, frame:frame, Maxframe:maxframe, alignment:alignment,lineLimit:lineLimit, opacity:opacity, offset:offset, padding:padding
                                                      ))
                    
                }
}

struct ContentView: View {
    @State var currentPosition:Int = 0
    var body: some View {
        VStack(spacing: 0){
            TabView(selection:$currentPosition) {
                ForEach(AppOnboardingModel.list) { viewdata in
                    OnboradingView(data:viewdata)
                        .tag(viewdata.id)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .padding(.bottom, .init(h: 54))
            
            nextButton
                .padding(.bottom, .init(h: UIdeviceSize.width < 376 ? 30 : 70))
        }
    }
}

extension ContentView{
    
    var nextButton: some View {
        Button {
            currentPosition += 1
        } label: {
        
                Image(systemName:"arrow.right")
                .customModifier(backgroundColor:.blue,foregroundColor:.white, cornerRadius:.init(h:68,for:68)/2 ,frame: (width:.init(w:68), height:.init(h:68,for:68), alignment:.center))
            }
            
        }
}
    
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
