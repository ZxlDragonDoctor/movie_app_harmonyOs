import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

import moveDAO from '../dao/MoveDAO'
import { MoveNote } from '../beans/MoveNote'



@Preview
@Entry
@Component
struct MovieDetail {
  @State movie: MoveNote[] = []  // 存储多个电影信息

  aboutToAppear(){
    this.getData()
    console.log('页面渲染完成')
    console.info('渲染的数据',this.movie)
  }
  getData(){
    moveDAO.getNotes().then(data=>{
      this.movie=data
    })
  }
  build() {
    Column({ space: 10 }) {
      // 头部导航栏
      Row() {
        Image($r('app.media.back')).height(30)
          .interpolation(ImageInterpolation.High) // 高亮显示返回图标
          .onClick(() => {
            router.back() // 返回到收藏页面
          })
        Text('收藏栏').width(80).height(50)
          .fontSize(20).fontWeight(FontWeight.Bold)
      }.width('100%')
      .height(50)
      .shadow({ radius: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(10)

      // 遍历电影数组，展示每部电影的信息
      ForEach(this.movie, (item, index) => {
        Column({ space: 10}) {
          // 显示电影海报
          Row() {
            Image(item.poster).width('100%').height(250)
              .interpolation(ImageInterpolation.High)
              .shadow({ radius: 10 })
          }.width('100%')

          // 电影信息展示
          Column({ space: 10 }) {
            // 电影标题
            Text(`标题: ${item.title}`).fontSize(18).fontWeight(FontWeight.Bold)
            // 电影类型
            Text(`类型: ${item.genre}`).fontSize(16)
            // 导演
            Text(`导演: ${item.director}`).fontSize(16)
            // 上映日期
            Text(`上映日期: ${item.release_date}`).fontSize(16)
            // 简介
            Text(`简介: ${item.profile}`).fontSize(16).textOverflow({ overflow: TextOverflow.Ellipsis }).maxLines(5)
            Row() {
              Text(`观看链接: ${item.link}`).fontSize(16).fontWeight(FontWeight.Bold)
            }.width('100%')
          }.padding(10)

          // 删除电影按钮
          if (item.deleted === 0) {
            Row() {
              Button('删除电影').onClick(() => {
                // 执行删除操作
                this.deleteMovie(item.movieid)
              }).width('100%').height(40).backgroundColor(Color.Red)
            }.padding(20)
          }
        }.width('100%').height('auto')
      })

    }.width('100%').height('100%')
  }

  // 删除电影
  deleteMovie(movieid: number) {
    ActionSheet.show({
      title: "删除确认",
      message: "您确定要删除这部电影吗？",
      sheets: [],
      confirm: {
        value: "确认删除",
        action: () => {
          moveDAO.remove(movieid).then(flag => {  // 修正为 movieId
            if (flag) {
              promptAction.showToast({ message: '电影已成功移除收藏' })
              this.getData() // 刷新电影数据
            } else {
              promptAction.showToast({ message: '删除失败，请重试' })
            }
          })
        }
      }
    })
  }


}
