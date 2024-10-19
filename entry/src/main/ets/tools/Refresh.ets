import {Information} from './Interface'
import HttpTool from './HttpTool'
import { http } from '@kit.NetworkKit'

class Refresh {
  endpoint: string = '511aeb9d1a.st1.iotda-app.cn-north-4.myhuaweicloud.com' // 应用侧https端点
  project_id: string = 'bf3001549a7f4da3b4f90ed04c3aa5ce' // 项目id
  device_id: string = '6612bcb42ccc1a5838802a53_cjRGTFXd' // 设备id
  service_id: string = '智慧农业' // 服务id

  information: Information = {
    soilHumidity: '',
    luminance: '',
    pumpStatus: '停止',
    shedStatus: '关闭',
    workStatus: '无人值守'
  };

  async getShadowData(information: Information) {
    let url: string = `https://${this.endpoint}/v5/iot/${this.project_id}/devices/${this.device_id}/shadow`

    HttpTool.get(url, (data: http.HttpResponse) => {
      information.soilHumidity = data.result['shadow'][0].reported.properties.soilHumidity
      information.luminance = data.result['shadow'][0].reported.properties.luminance
      information.pumpStatus = data.result['shadow'][0].reported.properties.pumpStatus
      information.shedStatus = data.result['shadow'][0].reported.properties.shedStatus
      information.workStatus = data.result['shadow'][0].reported.properties.workStatus
    })

    console.info(JSON.stringify(information))
  }
}

export default new Refresh()