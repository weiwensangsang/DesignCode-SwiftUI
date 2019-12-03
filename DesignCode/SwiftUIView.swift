//
//  SwiftUIView.swift
//  DesignCode
//
//  Created by zhen xia on 2019/12/3.
//  Copyright © 2019 Mithun. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    /// 背景颜色
    @State private var bgColor = Color.gray

    /// 半径弧度
    @State private var cr :CGFloat = 122
    
    var body: some View {
        Button(action: {
             /// 按钮事件
             withAnimation() {
                self.bgColor = self.bgColor == Color.gray ? Color.blue : Color.gray
                self.cr = self.cr == 12 ? 100 : 12
            }
        }) {
            /// 按钮文字标题内容
            Text("Animation dis33")
            /// 前景颜色
            .foregroundColor(.white)
            /// 大小
            .frame(width: 200, height: 200, alignment: .center)
            ///背景颜色
            .background(bgColor)
            ///字体类型
            .font(.title)
            ///半径弧度
            .cornerRadius(cr)
            ///动画
                .animation(.easeInOut(duration: 4))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
