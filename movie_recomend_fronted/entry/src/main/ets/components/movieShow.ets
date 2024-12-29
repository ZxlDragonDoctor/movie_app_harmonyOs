import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

import moveDAO from '../dao/MoveDAO'
import { MoveNote } from '../beans/MoveNote'
import { User } from '../beans/User'

@Preview
@Entry
@Component
struct MovieCollection {
  @State moves:MoveNote[] = []

  aboutToAppear(){
    this.getData()
    console.log('页面渲染完成')
    console.log("获取loginuser对象账号:"+AppStorage.Get<User>("loginUser").getUsername());
    console.log("获取loginuser对象密码:"+AppStorage.Get<User>("loginUser").getPassword());
    console.info('渲染的数据',this.moves)
  }
  getData(){
    moveDAO.getNotes().then(data=>{
      this.moves=data
    })
  }
  build() {
    Column({ space: 5 }) {
      // 头部导航栏
      Row() {
        Image($r('app.media.back')).height(30)
          .interpolation(ImageInterpolation.High)
          .onClick(() => {
            router.pushUrl({ url: "pages/login" })
          }).margin({ right: 100 })
        Text('电影展示').width(80).height(50)
          .fontSize(20).fontWeight(FontWeight.Bold)
        Blank()
        Image($r('app.media.shoucang1')).height(50).width(50).onClick(()=>{
          router.pushUrl({
            url:"components/shoucanglan",
          });
        })

      }.width('100%')
      .height(50)
      .shadow({ radius: 10 })
      .padding(10)

      // 使用Grid布局展示电影信息
      Grid() {
        ForEach(this.moves, (item: MoveNote) => {
          GridItem() {
            Column({ space: 20 }) {
              // 显示电影海报
              Image(item.poster).width(100).height(100)
                .interpolation(ImageInterpolation.High)

              // 显示电影标题
              Text(item.title).fontSize(16)
            }
            .onClick(() => {
              //全局管理movieid
              AppStorage.SetOrCreate("movie",item);
              // 点击电影条目，跳转到电影详情页面
              router.pushUrl({
                url: 'components/movieDetail',
                // params: { movie: item }
              })
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr ') // 设置每行四列
      .columnsGap(10) // 列间距
      .rowsGap(10)    // 行间距
      .width('100%')
      .height('auto') // 自适应高度

    }.width('100%').height('100%')
  }
}
