import { DeviceProperty, Verification } from './Interface';
import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

class UpdateReport {
  access_token: string = ''
  deviceProperty: DeviceProperty = {
    endpoint_app: '511aeb9d1a.st1.iotda-app.cn-north-4.myhuaweicloud.com',
    endpoint_device: '511aeb9d1a.st1.iotda-device.cn-north-4.myhuaweicloud.com', // 设备侧https端点
    project_id: 'bf3001549a7f4da3b4f90ed04c3aa5ce', // 项目id
    device_id: '6612bcb42ccc1a5838802a53_cjRGTFXd', // 设备id
    service_id: '智慧农业' // 服务id
  }
  verification: Verification = {
    device_id: '6612bcb42ccc1a5838802a53_cjRGTFXd',
    sign_type: 0,
    timestamp: '2024101909',
    password: '9f8f9643a6aef45246b97b1d44eb2fafd94dfef95fcc94353040733f4db04302'
  }

  // 请求access_token
  async getAccessToken() {
    let url: string = `https://${this.deviceProperty.endpoint_device}/v5/device-auth`
    let httpRequest = http.createHttp();

    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: this.verification,
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
      header: {
        'Content-Type': 'application/json;charset=UTF-8',
      }
    }
    httpRequest.request(url, options, (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        // console.info('access_token:' + JSON.stringify(data.result));
        this.access_token = data.result['access_token']
        console.info('access_token:' + this.access_token);
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    })
  }

  // 属性上报(https协议)
  // async report(params: CommandBody) {
  //   let url: string = `https://${this.endpoint}/v5/devices/${this.device_id}/sys/properties/report`
  //
  //   HttpTool.post(url, params, (data: http.HttpResponse) => {
  //     console.info('ShadowData:' + JSON.stringify(data.result));
  //   })
  // }
}

export default new UpdateReport()