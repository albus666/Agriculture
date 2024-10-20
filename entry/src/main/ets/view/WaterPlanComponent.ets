import { DeviceShadow, CommandBody } from '../tools/Interface';
import Refresh from '../tools/Refresh';
import CommandSent from '../tools/ComandSent'


@Component
export struct WaterPlanComponent {
  @State timer: number = 0
  @State deviceShadow: DeviceShadow = {
    soilHumidity: '',
    luminance: '',
    pumpStatus: '停止',
    shedStatus: '关闭',
    workStatus: '无人值守'
  };
  // 和刷新配合控制开关
  @State pumpControl: boolean = false ? this.deviceShadow.pumpStatus === '停止' ? true : false : false // 水泵控制初始化
  @State shedControl: boolean = false ? this.deviceShadow.shedStatus === '关闭' ? true : false : false // 棚罩控制初始化
  @State workControl: boolean = false ? this.deviceShadow.workStatus === '无人值守' ? true : false : false // 工作控制初始化

  aboutToAppear(): void {
    Refresh.getShadowData(this.deviceShadow)
    this.timer = setInterval(async () => {
      await Refresh.getShadowData(this.deviceShadow)
    }, 3000)
  }

  build() {
    Column({ space: 8 }) {
      Text('灌溉计划')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .margin({ top: 10 })
      Divider().width('95%')
      //农田信息
      Row() {
        Text('农田编号:')
          .fontSize(22)
          .fontWeight(FontWeight.Bolder)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Text('1')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bolder)


      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('农田名称:')
          .fontSize(22)
          .fontWeight(FontWeight.Bolder)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Text('')
        Select([{ value: '老张的玉米地', icon: $r('app.media.leaf') },
          { value: '张万年的高粱地', icon: $r('app.media.leaf') },
          { value: '李老四的蔬菜大棚', icon: $r('app.media.leaf') },
          { value: '小六子的自留地', icon: $r('app.media.leaf') },
          { value: '王老五的麦田', icon: $r('app.media.leaf') }])
          .fontColor(Color.Black)
          .height(25)
          .width(65)
          .backgroundColor('#C0D9D9')


      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()

      Text('手动灌溉')
        .fontSize(24)
        .fontWeight(FontWeight.Bolder)
        .fontColor(Color.White)
        .margin({ top: 10 })
        .fontColor(Color.White)
      Divider().width('95%')
      Row() {
        Text('开启水阀:')
          .fontSize(22)
          .fontWeight(FontWeight.Bolder)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Toggle({ type: ToggleType.Switch, isOn: false })
          .onClick(async () => {
            let command: CommandBody = {
              "service_id": "智慧农业",
              "command_name": "irrigation",
              paras: {
                "pumpControl": !this.pumpControl
              }
            }
            CommandSent.Sent(command)
          })

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()

      Text('定时灌溉')
        .fontSize(24)
        .fontWeight(FontWeight.Bolder)
        .fontColor(Color.White)
        .margin({ top: 10 })
        .fontColor(Color.White)
      Divider().width('95%')

      Row() {
        Text('频率:')
          .fontSize(22)
          .fontWeight(FontWeight.Bolder)
          .fontColor(Color.White)
        Row() {
          Radio({ value: '1', group: 'frequency' }).checked(true)
          Text('每天')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }

        Row() {
          Radio({ value: '2', group: 'frequency' }).checked(false)
          Text('每周')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }

        Row() {
          Radio({ value: '3', group: 'frequency' }).checked(false)
          Text('每月')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('开始时间:')
          .fontSize(22)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text('9:30')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.right'))
            .width(28)
            .height(28)
        }

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('持续时间:')
          .fontSize(22)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Select([
          { value: '10分钟', icon: $r('app.media.leaf') },
          { value: '20分钟', icon: $r('app.media.leaf') },
          { value: '30分钟', icon: $r('app.media.leaf') },
          { value: '40分钟', icon: $r('app.media.leaf') },
          { value: '50分钟', icon: $r('app.media.leaf') },
          { value: '60分钟', icon: $r('app.media.leaf') }])
          .fontColor(Color.Black)
          .height(25)
          .width(65)
          .backgroundColor('#C0D9D9')

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('水阀控制:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Toggle({ type: ToggleType.Switch, isOn: false })

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .width('100%')
    .height('100%')
    .backgroundImage($r("app.media.mailang3")) // 设置图片背景
    .backgroundImageSize(ImageSize.Cover) // 覆盖背景
  }
}