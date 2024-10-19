// import cloud, { AuthUser } from '@hw-agconnect/cloud'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import picker from '@ohos.file.picker'
// import { PhoneUtil } from '@hw-agconnect/cloud/src/main/ets/auth/utils/PhoneUtil'
import prompt from '@ohos.prompt'

@Entry
@Component
struct PersonalData {
  @State photoUrl: string = ''
  @State displayName: string = ''
  // @StorageLink('user') user: AuthUser = null
  @State uploading: boolean = false
  @State uploadingText: string = '0%'

  // aboutToAppear() {
  //   //   1.cloud.auth().getCurrentUser()
  //   //   2.AppStorage
  //   this.displayName = this.user?.getDisplayName()
  //   this.photoUrl = this.user?.getPhotoUrl() // 避免预览器报错
  // }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
        // Stack() {
        //   Image($r('app.media.back'))
        //     .width(25)
        //     .height(25)
        //     .backgroundColor(Color.Transparent)
        //     .onClick(() => router.back())
        //     .margin({ top:10,right: 310 })
        //
        //   Text('个人资料').fontSize(30).fontWeight(FontWeight.Bold).height(50);
        // }.alignContent(Alignment.Center).margin({ top: 5 })
        // Divider().height(50).strokeWidth(3)

        // Column({ space: 30 }) {
        //   Stack() {
        //     Image(this.photoUrl ? this.photoUrl : $r('app.media.DTS'))
        //       .enabled(!this.uploading)
        //       .width(100)
        //       .height(100)
        //       .borderRadius(100)
        //       .onClick(async () => {
        //         try { //   1.从相簿中选照片
        //           const options = new picker.PhotoSelectOptions()
        //           options.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE
        //           options.maxSelectNumber = 1
        //           const result = await new picker.PhotoViewPicker().select(options)
        //           this.uploading = true
        //           hilog.info(0, 'Upload', `Picker Success ${result.photoUris[0]}`)
        //           //   2.调用云存储 api 上传照片
        //           await cloud.storage().upload({
        //             localPath: result.photoUris[0],
        //             cloudPath: `photo/${this.user.getUid()}.jpg`,
        //             onUploadProgress: event => {
        //               const present = Math.floor(100 * event.loaded / event.total)
        //               this.uploadingText = `${present}%`
        //             } // 获取上传进度
        //           })
        //           hilog.info(0, 'Upload', 'Upload Success')
        //           //   3.获取上传照片的网络地址
        //           const url = await cloud.storage().getDownloadURL(`photo/${this.user.getUid()}.jpg`)
        //           this.photoUrl = `${url}&ts=${new Date().getTime()}`
        //           this.uploading = false
        //           hilog.info(0, 'Upload', `url:${url}`)
        //         } catch (e) {
        //           hilog.error(0, 'Upload', JSON.stringify(e))
        //         } finally {
        //         }
        //       })
        //     if (this.uploading) {
        //       //   显示上传进度
        //       Text(this.uploadingText)
        //         .width(100)
        //         .height(100)
        //         .borderRadius(100)
        //         .fontColor(Color.White)
        //         .backgroundColor(Color.Black)
        //         .opacity(0.6)
        //         .fontSize(24)
        //         .fontWeight(FontWeight.Bolder)
        //         .textAlign(TextAlign.Center)
        //
        //     }
        //   }
        //
        //   Text('点击修改').fontSize(15).opacity(0.6);
        // }.margin({ top: 40 });


        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Center }) {
          Text('昵称').fontSize(18);
          TextInput({ placeholder: '请设置昵称', text: this.displayName })
            .width('50%')
            .onChange(value => {
              this.displayName = value
            })
            .width('100%')
            .height(60)
            .margin({ top: 10 });

          Text('简介').fontSize(18).margin({ top: 20 });
          TextInput({ placeholder: '该项暂不支持修改', text: '一生万物，万物归一' })
            .width('100%')
            .margin({ top: 10 })
            .height(100);

          Button('保存')
            .width('100%')
            .height(50)
            .margin({ top: 20 })
            .backgroundColor(Color.Green)
            .fontColor(Color.White)
            .onClick(async () => {
              // try {
              //   await this.user.updateProfile({
              //     displayName: this.displayName,
              //     photoUrl: this.photoUrl
              //   })
              //   hilog.info(0, 'updateProfile', 'Success')
              // } catch (e) {
              //   hilog.error(0, 'updateProfile', JSON.stringify(e))
              // }
              router.pushUrl({url:'pages/MainPage'})
              prompt.showToast({
                message: '保存成功',
                duration: 2000
              })
            })

        }.width('90%').margin({ top: 20, bottom: 20 })
      }.width('100%')
    }
  }
}