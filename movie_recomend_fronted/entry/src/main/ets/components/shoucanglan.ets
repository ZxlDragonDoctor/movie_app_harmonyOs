import router from '@ohos.router'
import { MoveNote } from '../beans/MoveNote'
import { User } from '../beans/User'
import SavDAO from '../dao/SaveDao'

class MyDataSource implements IDataSource {
  private list: MoveNote[] = []
  private listener: DataChangeListener

  constructor(list: MoveNote[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct shoucanglan {

  @State saveDao: SavDAO = new SavDAO(); // 收藏访问对象
  @State movies: MoveNote[] = [] // 存储查询到的电影信息

  aboutToAppear(): void {
    this.getData()  // 获取收藏的
  }

  // 获取收藏电影数据
  getData(): void {
    const loginUser: User = AppStorage.Get<User>("loginUser")  // 获取当前登录的用户
    this.saveDao.select(loginUser).then(data => {
      console.log("获取到的收藏电影数据:", data);  // 调试输出数据
      if (data && data.length > 0) {
        this.movies = data;
      } else {
        console.log("没有收藏的电影");
      }
    }).catch(error => {
      console.error("获取收藏电影数据失败:", error);  // 错误处理
    });
  }

  build() {
    Column({space:10}) {
      Row() {
        Image($r('app.media.back')).height(30)
          .interpolation(ImageInterpolation.High)
          .onClick(() => {
            router.pushUrl({ url: "components/movieShow" })
          }).margin({ right: 100 })
        Text('我的收藏栏').width(100).height(50)
          .fontSize(20).fontWeight(FontWeight.Bold)
      }.width('100%')
      .height(40)


      Scroll(){
       List({space:10}){
         ForEach(this.movies, (item, index) => {
           ListItem(){
             Column({ space: 55 }) {
               Row() {
                 Image(item.poster).width('100%').height(260)
               }

             }
           }.onClick(()=>{
             router.pushUrl({url:"pages/Bofang"})
           })
           ListItem(){
             Column(){
               Row(){
                 Text("电影名称："+item.title).fontSize(20).fontStyle(FontStyle.Italic)
               }
             }
           }

         })
       }
     }.margin({bottom:60})

    }.width('100%')
    .margin({ top: 5 })
  }
}