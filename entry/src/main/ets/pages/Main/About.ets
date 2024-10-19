import osAccount from '@ohos.account.osAccount'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  private value: string = '郑州西亚斯学院-数字技术产业学院\n队名：芝士雪豹\n成员:\n曹航源\n王奥琪\n王天逸\n赵广生'
  build() {
    Row() {
      Column() {
        Stack() {
          Image($r('app.media.back'))
            .width(25)
            .height(25)
            .backgroundColor(Color.Transparent)
            .onClick(() => router.back())
            .margin({right: 310 })

          Text('关于')
            .fontSize(30).fontWeight(FontWeight.Bold).height(50);
        }.alignContent(Alignment.Center)
        .margin({ top: 5 })
        Divider().strokeWidth(3)

        Image($r('app.media.zsxb'))
          .width(200)
          .margin({ top: 10 })


        Text('芝士雪豹')
          .margin(20)
          .fontSize(35)
          .textAlign(TextAlign.Center)
          .fontWeight(FontWeight.Bolder)
          .height(80)
          .width(250)


          .borderImage({
            source: {
              angle: 90,
              direction: GradientDirection.Left,
              colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
            },
            slice: { top: 10, bottom: 10, left: 10, right: 10 },
            width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
            repeat: RepeatMode.Stretch,
            fill: false
          })
        Text('     扫码了解详细信息')
          .fontSize(9)
          .width('90%')
          .fontColor(0xCCCCCC)
          .fontSize(30)
          .margin({ top: 10 })
        QRCode(this.value).width(170).height(170).margin({ top: 30 })
      }
      .width('100%')
    }
    .height('50%')
  }
}
