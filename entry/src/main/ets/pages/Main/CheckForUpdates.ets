import router from '@ohos.router';
import prompt from '@ohos.prompt';

@Entry
@Component
struct LoadingPage {
  @State num: number = 0;
  @State numZ: number = 100;
  @State twonum: number = 90;
  @State twonumZ: number = 90;
  @State threenum: number = 180;
  @State threenumZ: number = 90;
  @State fornum: number = 270;
  @State fornumZ: number = 270;
  @State showSeconds: number = 3; // 3秒跳转
  private timerId: number = -1; // 定时器id

  onPageShow(): void {
    console.log('页面触发')
    animateTo({
      duration: 2000,
      iterations: -1,
      curve: Curve.Linear
    }, () => {
      this.num = 360;
      this.numZ = 470;
      this.twonum = 450;
      this.twonumZ = 470;
      this.threenum = 480;
      this.threenumZ = 450;
      this.fornum = 610;
      this.fornumZ = 630;
    })

  }

  build() {
    Stack() {
      Row() {
      }
      .width(190)
      .height(190)
      .border({ width: { bottom: 8 }, color: 'rgb(255,141,249)', style: BorderStyle.Solid })
      .borderRadius(90)
      .rotate({
        x: 50,
        y: 0,
        z: this.numZ,
        angle: this.num,
        centerX: 80,
        centerY: 80,
      })

      Row() {
      }
      .width(190)
      .height(190)
      .border({ width: { bottom: 8 }, color: 'rgb(255,65,106)', style: BorderStyle.Solid })
      .borderRadius(90)
      .rotate({
        x: 20,
        y: 50,
        z: this.twonumZ,
        angle: this.twonum,
        centerX: 80,
        centerY: 80,
      })

      Row() {
      }
      .width(190)
      .height(190)
      .border({ width: { bottom: 8 }, color: 'rgb(0,255,255)', style: BorderStyle.Solid })
      .borderRadius(90)
      .rotate({
        x: 40,
        y: 150,
        z: this.threenumZ,
        angle: this.threenum,
        centerX: 80,
        centerY: 80,
      })

      Row() {
      }
      .width(190)
      .height(190)
      .border({ width: { bottom: 8 }, color: 'rgb(252,183,55)', style: BorderStyle.Solid })
      .borderRadius(90)
      .rotate({
        x: 70,
        y: 0,
        z: this.fornumZ,
        angle: this.fornum,
        centerX: 80,
        centerY: 80,
      })

      Row() {
      }
      .width(190)
      .height(190)
      .border({ width: { bottom: 8 }, color: 'rgb(252,183,55)', style: BorderStyle.Solid })
      .borderRadius(90)
      .rotate({
        x: 70,
        y: 0,
        z: this.fornumZ,
        angle: this.fornum,
        centerX: 80,
        centerY: 80,
      })

      Row() {
        Text(`检查更新中...`) // 展示倒计时3秒
          .fontSize(20)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold);
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f2f3')
  }

  aboutToAppear() {
    this.timerId = setInterval(() => {
      if (this.showSeconds > 0) {
        this.showSeconds--;
      } else {
        clearInterval(this.timerId); // 跳转前清理计时器
        router.back()
        prompt.showToast({
          message: '您当前已为最新版本',
          duration: 2000 })
      }
    }, 1000);
  }
}
