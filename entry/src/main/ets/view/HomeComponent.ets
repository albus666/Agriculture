import { Information, CommandBody } from '../tools/Interface'
import http from '@ohos.net.http';
import HttpTool from '../tools/HttpTool';
import Refresh from '../tools/Refresh';

@Component
export default struct HomeComponent {
  // 配置信息
  endpoint: string = '511aeb9d1a.st1.iotda-app.cn-north-4.myhuaweicloud.com' // 应用侧https端点
  project_id: string = 'bf3001549a7f4da3b4f90ed04c3aa5ce' // 项目id
  device_id: string = '6612bcb42ccc1a5838802a53_cjRGTFXd' // 设备id
  service_id: string = '智慧农业' // 服务id
  @State timer: number = 0
  // 设备属性
  @State information: Information = {
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
    Refresh.getShadowData(this.information)
    this.timer = setInterval(async () => {
      await Refresh.getShadowData(this.information)
    }, 3000)
  }

  // 属性上报(https协议)
  async report(params: CommandBody) {
    let url: string = `https://${this.endpoint}/v5/devices/${this.device_id}/sys/properties/report`

    HttpTool.post(url, params, (data: http.HttpResponse) => {
      console.info('ShadowData:' + JSON.stringify(data.result));
    })
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
        Text(`${this.information.soilHumidity}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //光线强度
      Row() {
        Text('光线强度:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(`${this.information.luminance}`)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //水泵
      Row() {
        Text('水泵状态:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(this.information.pumpStatus)
          .fontSize(20)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      //棚罩
      Row() {
        Text('棚罩状态:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(this.information.shedStatus)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

      // 工作
      Row() {
        Text('工作模式:')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(this.information.workStatus)
          .fontSize(20)

      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f2f3')
  }
}

