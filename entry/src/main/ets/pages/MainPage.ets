import { TabID, TabItemList } from '../model/TabItem';
import HomeComponent from '../view/HomeComponent';
import { MineComponent } from '../view/MineComponent';
import { WaterPlanComponent } from '../view/WaterPlanComponent';
@Entry
@Component
struct MainPage {
  @State pageIndex: number = 0;//页面索引
  private tabController: TabsController = new TabsController();//tab切换控制器


  build() {
    Tabs({barPosition:BarPosition.End}){

      TabContent(){
        //Text('主页')
        HomeComponent()//主页
      }
      //.tabBar('主页')
      .tabBar(this.MyTabBuilder(TabID.HOME))

      TabContent(){
        //Text('灌溉计划')
        WaterPlanComponent()//灌溉计划组件
      }
      //.tabBar('灌溉计划')
      .tabBar(this.MyTabBuilder(TabID.WATER_PLAN))

      TabContent(){
        //Text('我的')
        MineComponent()//个人主页
      }
      //.tabBar('我的')
      .tabBar(this.MyTabBuilder(TabID.MINE))

    }
    .barWidth('100%')
    .barMode(BarMode.Fixed)
    .width('100%')
    .height('100%')
    .onChange((index)=>{//绑定onChange函数切换页签
      this.pageIndex = index;
    })

  }

  @Builder MyTabBuilder(idx: number){
    Column(){
      Image(idx === this.pageIndex ? TabItemList[idx].icon_selected : TabItemList[idx].icon)
        .width(32)
        .height(32)
      Text(TabItemList[idx].title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.pageIndex === idx ? '#006eee':'#888')
    }
  }
}