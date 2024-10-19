// import cloud, { AuthUser } from '@hw-agconnect/cloud';
import router from '@ohos.router';
import { InfoItem, MineItemList } from '../model/MineItemList';

@Component
export struct MineComponent {
  @State image: string = '    >'; //图片
  @State photoUrl: string = ''
  @State displayName: string = ''
  // @StorageLink('user') user: AuthUser = null

  // async aboutToAppear() {
  //   //   1.cloud.auth().getCurrentUser()
  //   //   2.AppStorage
  //   this.displayName = this.user?.getDisplayName()
  //   this.photoUrl = this.user?.getPhotoUrl() // 避免预览器报错
  //   const url = await cloud.storage().getDownloadURL(`photo/${this.user.getUid()}.jpg`)
  //   this.photoUrl = `${url}&ts=${new Date().getTime()}`
  // }

  build() {
    Column() {
      Column({space:10}) {
        Image(this.photoUrl ? this.photoUrl : $r('app.media.DTS'))
          .width(68)
          .height(68)
          .borderRadius(68)
        Text(this.displayName ? this.displayName : 'DTS')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
        Text('一生万物，万物归一')
          .fontSize(18)
          .fontColor(Color.Orange)


      }.width('95%')
      .margin(20)

      //功能列表
      Column() {
        List() {
          ForEach(MineItemList, (item: InfoItem) => {
            ListItem() {
              Row() {
                Row() {
                  Image(item.icon)
                    .width(38)
                    .height(38)
                  Text(item.title)
                    .fontSize(22)
                    .fontColor(Color.Blue)
                }

                Button(this.image)
                  .fontColor(Color.Blue)
                  .fontSize(40)
                  .type(ButtonType.Normal)
                  .backgroundColor(Color.Transparent)
                  .width('100')
                  .onClick(() => router.pushUrl({ url: `pages/Main/${item.name}` })) // 绑定点击事件
              }
              .width('100%')
              .height(52)
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .border({
              width: { bottom: 1 },
              color: Color.Gray

            })

          },)
            // item => JSON.stringify(item))
        }
        .margin(10)
        .border({
          radius: {
            topLeft: 24,
            topRight: 24
          }
        })
        // .backgroundColor('opacity(1)')
        .width('100%')
        .height('90%')

      }
      .width('95%')

    }
    .width('100%')
    .height('100%')
    .backgroundImage($r("app.media.mailang0")) // 设置图片背景
    .backgroundImageSize(ImageSize.Cover)
  }
}