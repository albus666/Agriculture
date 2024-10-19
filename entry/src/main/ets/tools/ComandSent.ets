import { CommandBody } from './Interface'
import { BusinessError } from '@kit.BasicServicesKit';
import http from '@ohos.net.http';

class CommandSent {
  endpoint: string = '511aeb9d1a.st1.iotda-app.cn-north-4.myhuaweicloud.com' // 应用侧https端点
  project_id: string = 'bf3001549a7f4da3b4f90ed04c3aa5ce' // 项目id
  device_id: string = '6612bcb42ccc1a5838802a53_cjRGTFXd' // 设备id
  service_id: string = '智慧农业' // 服务id

  async Sent(params: CommandBody) {
    let url: string = `https://${this.endpoint}/v5/iot/${this.project_id}/devices/${this.device_id}/commands`
    let httpRequest = http.createHttp();

    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: params,
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
      header: {
        'Accept': 'application/json',
        'X-Auth-Token': globalThis.hw_token
      }
    }
    let commandName = params.command_name;
    let sendName = Object.keys(params.paras)[0];

    httpRequest.request(url, options, (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        console.info('ShadowData:' + JSON.stringify(data.result));
        // 获取下发的命令名称
        console.info(JSON.stringify(sendName));
        sendName = data.result['response']['response'].paras.result
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    })
  }
}

export default new CommandSent()