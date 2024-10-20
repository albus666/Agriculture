import { DeviceShadow } from '../tools/Interface'
import Refresh from '../tools/Refresh';
import UpdateReport from '../tools/UpdateReport';


@Component
export default struct HomeComponent {
  @State timer: number = 0
  @State access_token: string = ''
  // 设备属性
  @State devicesShadow: DeviceShadow = {
    soilHumidity: '',
    luminance: '',
    pumpStatus: '停止',
    shedStatus: '关闭',
    workStatus: '无人值守'
  };
  // 为了UI好看，不用管这个属性
  @State pm25: number = 0
  @State airQuality: string = '--'

  // 页面加载时，获取设备影子数据
  aboutToAppear(): void {
    Refresh.getShadowData(this.devicesShadow)
    this.timer = setInterval(async () => {
      await Refresh.getShadowData(this.devicesShadow)
    }, 3000)
  }

  build() {
    Column({ space: 8 }) {
      Text('选择农田')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Orange)
        .margin({ top: 10 })
      Divider().width('95%')

      Row() {
        Select([{ value: '老张的玉米地', icon: $r('app.media.leaf') },
          { value: '张万年的高粱地', icon: $r('app.media.leaf') },
          { value: '李老四的蔬菜大棚', icon: $r('app.media.leaf') },
          { value: '小六子的自留地', icon: $r('app.media.leaf') },
          { value: '王老五的麦田', icon: $r('app.media.leaf') }])
          .selected(0)
          .value('选择农田')
          .font({ size: 24, weight: 600 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 22, weight: 600 })
          .optionFont({ size: 18, weight: 500 })

      }.width('95%')

      Divider().width('95%')
      Text('传感器数据')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Orange)
        .margin({ top: 10 })
      Divider().width('95%')

      //土壤湿度
      Row() {
        Text('土壤湿度:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(`${this.devicesShadow.soilHumidity}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //光线强度
      Row() {
        Text('光线强度:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(`${this.devicesShadow.luminance}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //水泵
      Row() {
        Text('水泵状态:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(this.devicesShadow.pumpStatus)
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //棚罩
      Row() {
        Text('棚罩状态:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(this.devicesShadow.shedStatus)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      // 工作
      Row() {
        Text('工作模式:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(this.devicesShadow.workStatus)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      Button('请求access_token')
        .fontSize(24)
        .onClick(() =>
        UpdateReport.getAccessToken())
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f2f3')
  }
}

