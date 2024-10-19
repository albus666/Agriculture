// @State token: string = ''
// @State farmBean: FarmBean = ;
// private timerId: number = 0; //计时器id，每5秒读取一次数据
// endpoint: string = 'https://iotda.cn-north-4.myhuaweicloud.com' // 修改自己的网络地址
// project_id: string = 'bf3001549a7f4da3b4f90ed04c3aa5ce' // 在‘我的凭证’中找
// device_id: string = '6612bcb42ccc1a5838802a53_cjRGTFXd'
// service_id: string = '智慧农业'
// light_command: string = 'Agriculture_Control_Light'
// motor_command: string = 'Agriculture_Control_Motor'

// /* 读取刚刚写入token.txt中的token */
// let context1 = getContext(this) as common.UIAbilityContext;
// let filesDir1 = context1.filesDir;
// // let file = fs.openSync(filesDir + '/te0st.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
// let file1 = fs.openSync(filesDir1 + '/token.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
// let buf1 = new ArrayBuffer(99999);
// let readLen1 = fs.readSync(file1.fd, buf1, { offset: 0 });
// let name1: string = String.fromCharCode.apply(null, new Uint8Array(buf1.slice(0, readLen1)))
// let name21 = name1.trimEnd()
// fs.closeSync(file1);


// @State token: string = name21;

// aboutToAppear() {
//   // if (globalThis.token) {
//   //   this.token = globalThis.token;
//   // }
//   // setInterval(() => {
//   //   this.initProperties()
//   // }, 3000);
//   // //当页面出现时获取设备数据
//   // this.loadFarmData();
//
//   //每隔5秒加载一次数据
//   // this.timerId = setInterval(() => {
//   //   this.loadFarmData();
//   // }, 5000)
//
//   //当页面出现时获取设备数据
//   this.initProperties()
//
//   //每隔2秒加载一次数据
//   this.timerId = setInterval(() => {
//     this.initProperties();
//   }, 2000)
// }

// initProperties() {
//   let httpRequest = http.createHttp();
//   httpRequest.on('headersReceive', (header) => {
//     console.info('header: ' + JSON.stringify(header));
//   });
//   httpRequest.request(
//     "https://511aeb9d1a.st1.iotda-app.cn-north-4.myhuaweicloud.com:443/v5/iot/bf3001549a7f4da3b4f90ed04c3aa5ce/devices/6612bcb42ccc1a5838802a53_cjRGTFXd/shadow",
//     {
//       method: http.RequestMethod.GET,
//       header: {
//         'X-Auth-Token': this.token,
//       },
//       extraData: {
//         "project-id": "bf3001549a7f4da3b4f90ed04c3aa5ce",
//         'device_id': '6612bcb42ccc1a5838802a53_cjRGTFXd'
//       },
//       expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
//       usingCache: true, // 可选，默认为true
//       priority: 1, // 可选，默认为1
//       connectTimeout: 60000, // 可选，默认为60000ms
//       readTimeout: 60000, // 可选，默认为60000ms
//       usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
//     }, (err, data) => {
//     if (!err) {
//       this.message = data.result as string
//     } else {
//       httpRequest.off('headersReceive');
//       httpRequest.destroy();
//     }
//   }
//   );
//   this.timerId = setInterval(() => {
//     this.chush = this.message
//     let huaweijson = JSON.parse(this.message)
//
//     this.tu_rang_shi_du = huaweijson.shadow[0].reported.properties["土壤湿度"]
//     this.guang_xian = huaweijson.shadow[0].reported.properties["光线强度"]
//     this.shui_beng = huaweijson.shadow[0].reported.properties["水泵状态"]
//     this.peng_zhao = huaweijson.shadow[0].reported.properties["棚罩状态"]
//     this.mo_shi = huaweijson.shadow[0].reported.properties["工作模式"]
//
//   }, 2000)
// }

// switchLight() {
//   let url = '/v5/iot/' + this.project_id + '/devices/' + this.device_id + '/commands';
//
//   let Light = this.lightStatus == 'OFF' ? 'ON' : 'OFF';
//
//   let commands = {
//     service_id: this.service_id,
//     command_name: this.light_command,
//     "paras": {
//       Light
//     }
//   };
//
//   HttpUtl.post(this.endpoint + url, commands, (result) => {
//     let jsonResult = JSON.parse(result);
//     if (jsonResult.response.result_code != 0) {
//       prompt.showToast({
//         message: '操作失败'
//       })
//     } else {
//       this.lightStatus = Light
//     }
//   });
// }

// switchMotor() {
//   let url = '/v5/iot/' + this.project_id + '/devices/' + this.device_id + '/commands';
//
//   let Motor = this.motorStatus == 'OFF' ? 'ON' : 'OFF';
//
//   let commands = {
//     service_id: this.service_id,
//     command_name: this.motor_command,
//     "paras": {
//       Motor
//     }
//   };
// }

//   HttpUtl.post(this.endpoint + url, commands, (result) => {
//     let jsonResult = JSON.parse(result);
//     if (jsonResult.response.result_code != 0) {
//       prompt.showToast({
//         message: '操作失败'
//       })
//     } else {
//       this.motorStatus = Motor
//     }
//   });
// }

// setAirQuality(pm25) {
//   console.log('pm25', pm25)
//   if (pm25 > 0 && pm25 <= 40) {
//     this.airQuality = '优';
//   } else if (pm25 > 40 && pm25 <= 70) {
//     this.airQuality = '良';
//   } else {
//     this.airQuality = '差';
//   }
// }