// import cloud, { AuthUser } from '@hw-agconnect/cloud'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import picker from '@ohos.file.picker'
// import { PhoneUtil } from '@hw-agconnect/cloud/src/main/ets/auth/utils/PhoneUtil'
import prompt from '@ohos.prompt'

@Entry
@Component
struct AccountSecurity {
  @State Uid: string = ''
  @State phoneNumber: string = ''
  @State Email: string = ''
  // @StorageLink('user') user: AuthUser = null

  // aboutToAppear() {
  //   this.Uid = this.user?.getUid()
  //   this.phoneNumber = this.user?.getPhone()
  //   this.Email = this.user?.getEmail()
  // }

  build() {
    Row() {
      Column({ space: 10 }) {
        Stack() {
          Image($r('app.media.back'))
            .width(25)
            .height(25)
            .backgroundColor(Color.Transparent)
            .onClick(() => router.back())
            .margin({ right: 310 })

          Text('账号与安全')
            .fontSize(30).fontWeight(FontWeight.Bolder).height(50);
        }.alignContent(Alignment.Center)
        .margin({ top: 10 })


        Column({ space: 20 }) {
          Divider().color(Color.Black).strokeWidth(3)
          Row() {
            Text('用户ID:')
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .width('35%')
              .margin({ left: 10 })
              .textAlign(TextAlign.Start)

            Text(this.Uid ? this.Uid : '未识别到登录信息')
              .width('55%')
              .margin({ right: 80 })
              .textAlign(TextAlign.End)


          }

          Divider()
          Row() {
            Text('手机号:')
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .width('35%')
              .margin({ left: 10 })
              .textAlign(TextAlign.Start)

            Text(this.phoneNumber ? this.phoneNumber : '点击绑定')
              .width('55%')
              .margin({ right: 10 })
              .textAlign(TextAlign.End)
              .onClick(() => {
                prompt.showToast({
                  message: '该功能正在开发中...',
                  duration: 2000 })
              })
          }

          Divider()
          Row() {
            Text('邮箱号:')
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .width('35%')
              .margin({ left: 10 })
              .textAlign(TextAlign.Start)

            Text(this.Email ? this.Email : '点击绑定')
              .width('55%')
              .margin({ right: 10 })
              .textAlign(TextAlign.End)
              .onClick(() => {
                prompt.showToast({
                  message: '该功能正在开发中...',
                  duration: 2000 })
              })
          }

          Divider()
          Blank()
          // Button('登出')
          //   .width('80%')
          //   .margin({ bottom: 10 })
          //   .onClick(async () => {
          //     try {
          //       await cloud.auth().signOut()
          //       hilog.info(0, 'SignOut', 'Success')
          //       router.replaceUrl({ url: 'pages/Login' })
          //     } catch (e) {
          //       hilog.error(0, 'SignOut', JSON.stringify(e))
          //     }
          //   })
        }.height('80%').width('100%')
      }
    }
  }
}