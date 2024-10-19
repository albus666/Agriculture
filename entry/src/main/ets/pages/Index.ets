import { IAM_User, HW_User } from '../tools/Interface'
import { prompt, router } from '@kit.ArkUI';
import { http } from '@kit.NetworkKit';
import HttpTool from '../tools/HttpTool';

@Entry
@Component
struct Index {
  @State
  user: IAM_User = {
    username: 'Albus',
    password: 'nu6wce96'
  }
  @State verifyCodeButtonText: string = '获取验证码'
  @State verifyCodeButtonEnable: boolean = true
  @State phoneNumber: string = ''
  @State verifyCode: string = ''
  @State token: string = ''

  IAM_login() {
    let url: string = 'https://iam.myhuaweicloud.com/v3/auth/tokens'
    let hw_user: HW_User = {
      "auth": {
        "identity": {
          "methods": ["password"],
          "password": {
            "user": {
              "name": this.user.username, // IAM用户名
              "password": this.user.password, // IAM用户密码
              "domain": {
                "name": "nb-74110" // IAM用户所属帐号名
              }
            }
          }
        },
        "scope": {
          "domain": {
            "name": "nb-74110" // IAM用户所属帐号名
          }
        }
      }
    }
    HttpTool.login_iot(url, hw_user, (data: http.HttpResponse) => {
      globalThis.hw_token = data.header['x-subject-token']
      this.token = data.header['x-subject-token']
      if (this.token != '') {
        console.info('token' + this.token)
        prompt.showToast({
          message: '登录成功',
          duration: 2000
        })
        router.pushUrl({
          url: 'pages/Loading'
        })
      }
    })
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Image($r('app.media.icon'))
          .width(78)
          .height(78)
          .margin({ top: 120, bottom: 20 })
        Text('智慧农业')
          .fontSize(24)
          .fontWeight(FontWeight.Medium)
          .fontColor('#182431')
        Text('登录账号以使用更多服务')
          .fontSize(16)
          .fontColor('#798189')
          .margin({ top: 20, bottom: 20 })
        TextInput({ placeholder: '请输入手机号' })
          .maxLength(11)
          .type(InputType.Number)
          .backgroundColor('#F0F2F4')
          .border({ color: '#ff008aff', width: '100%' })
          .onChange(value => {
            this.phoneNumber = value
          })

        Row() {
          TextInput({ placeholder: '请输入验证码' })
            .type(InputType.Number)
            .backgroundColor('#F0F2F4')
            .width('65%')
            .onChange(value => {
              this.verifyCode = value
            })

          Button(this.verifyCodeButtonText)
            .width('35%')
            .enabled(this.verifyCodeButtonEnable)
            .onClick(async () => {
              if (this.phoneNumber.length != 11) {
                prompt.showToast({
                  message: '请输入正确的手机号！',
                  duration: 2000,
                })
              } else {
                // this.waiting()
                // this.sending()
              }
            })
        }

        Row() {
          Text('')
          Text('收不到验证码')
            .fontColor('#017DFF')
            .onClick(() => {
              prompt.showToast({
                message: '该功能正在开发中...',
                duration: 2000
              })
            })
        }.width('100%')
        .margin({ top: 10 })
        .justifyContent(FlexAlign.SpaceBetween)

        Button('登录/注册')
          .onClick(async () => {
            this.IAM_login()
          })
          .width('100%')
          .margin({ top: 50, bottom: 10 })

      }.height('100%')
      .width('100%')
      .padding(10)
      .backgroundColor('#F1F3F5')
    }
  }
}
