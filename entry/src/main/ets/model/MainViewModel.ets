import FarmBean from '../common/bean/FarmBean';
export class MainViewModel {

  public getFarmData(fieldId: number):FarmBean {
    let farmBean = new FarmBean(1,'老张的玉米地',22.5,56,30,800,25);
    farmBean.temperature = farmBean.temperature + Math.floor(Math.random()*5)//模拟数据变动
    farmBean.humidity = farmBean.humidity + Math.floor(Math.random()*5)//模拟数据变动
    farmBean.lumination = farmBean.lumination + Math.floor(Math.random()*5)//模拟数据变动
    farmBean.co2 = farmBean.co2 + Math.floor(Math.random()*5)//模拟数据变动
    farmBean.soilHumidity = farmBean.soilHumidity + Math.floor(Math.random()*5)//模拟数据变动

    return farmBean;
  }
}

export default new MainViewModel();