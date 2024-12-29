import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

import moveDAO from '../dao/MoveDAO'
import pinglunDao from "../dao/pinglunDAO"
import { shuju } from '../beans/shuju'
import SavDAO from '../dao/SaveDao'
import { User } from '../beans/User'
import { MoveNote } from '../beans/MoveNote'



@Preview
@Entry
@Component
struct MovieDetail {
  @State tupian:number=1
  @State tupian1:number=1
  @State picture1:Resource=$r('app.media.aixin')
  @State picture:Resource=$r('app.media.shoucang')
  // @State params: any =router.getParams()
  @State movie:MoveNote = AppStorage.Get("movie")  //获取当前电影对象
  @State reviews: shuju[] = [] //电影评论列表
  @State saveDao:SavDAO = new SavDAO(); //收藏访问对象
  @State movieid:number= this.movie.movieid;

  /*
   * 页面首次出现
   */
  aboutToAppear(){
    console.log("首次获取评论")
    this.getData()
    console.log("判断是否收藏=====")
    this.saveDao.startflush(AppStorage.Get<User>("loginUser"),this.movieid).then(flag=>{
      console.log("flag==="+flag);
      if(flag){
        this.picture = $r('app.media.shoucang1')
        this.tupian=0;   // 修改收藏为已收藏
      }
    });
  }
  onPageShow(){
    console.log("刷新评论");
    this.getData();
  }
  getData(){
    console.log("当前页电影id:"+this.movieid)
    pinglunDao.getNotes(this.movieid).then(data=>{
      this.reviews=data
      console.log("刷新评论")
    })
  }
  build() {
    Column() {
      // 头部导航栏
      Row() {
        Image($r('app.media.back')).height(30)
          .interpolation(ImageInterpolation.High) // 高亮显示返回图标
          .onClick(() => {
            router.back() // 返回到收藏页面
          }).margin({ right: 100 })
        Text('电影详情').width(80).height(50)
          .fontSize(20).fontWeight(FontWeight.Bold)
      }.width('100%')
      .height(40)
      .shadow({ radius: 10 })

      .padding(10)

      Column({ space: 10}) {
        // 显示电影海报
        Row() {
          Image(this.movie.poster).width('100%').height(250)
            .interpolation(ImageInterpolation.High)
            .shadow({ radius: 10 })
        }.width('100%')

        // 电影信息展示
        Column({ space: 10 }) {
          // 电影标题
          Text(`标题: ${this.movie.title}`).fontSize(18).fontWeight(FontWeight.Bold)
          // 电影类型
          Text(`类型: ${this.movie.genre}`).fontSize(16)
          // 导演
          Text(`导演: ${this.movie.director}`).fontSize(16)
          // 上映日期
          Text(`上映日期: ${this.movie.releaseDate}`).fontSize(16)
          // 简介
          Text(`简介: ${this.movie.profile}`).fontSize(16).textOverflow({ overflow: TextOverflow.Ellipsis }).maxLines(5)
          Row() {
            Text(`观看链接: ${this.movie.link}`).fontSize(16).fontWeight(FontWeight.Bold)
          }.width('100%')
        }.padding(10)

      }.width('100%').height('auto')
        Row(){
          Image(this.picture).width(40).onClick(()=>{
            if (this.tupian==1){
            this.picture = $r('app.media.shoucang1')
            this.tupian=0
              this.saveDao.save(AppStorage.Get<User>("loginUser"),this.movie.movieid);//发送保存收藏请求
            } else {
              this.picture = $r('app.media.shoucang')
              this.tupian=1
              this.saveDao.remove(AppStorage.Get<User>("loginUser"),this.movie.movieid);//发送移除收藏请求
            }

          })
          Blank(210)
          Image($r("app.media.pinglun")).width(20).height(10).onClick(()=>{
            router.pushUrl({
              url:"pages/pinglun",
              params:{ movieid: this.movieid}
            });
          }
          ).width(70).height(40)
        }.justifyContent(FlexAlign.End)
      Scroll(){
      Column() {
        List() {
          ForEach(this.reviews, (item, index) => {

            ListItem() {

              Row() {
                Column({ space: 20 }) {
                  Row() {
                    Text('————————————————————')
                  }.height(10).width('100%').justifyContent(FlexAlign.SpaceBetween)

                  Row({ space: 20 }) {
                    Text(`${item.content}`).fontWeight(FontWeight.Bold)
                  }.height(20).width('100%').justifyContent(FlexAlign.SpaceBetween)

                  Row() {
                    Image(this.picture1).width(25).height(25).onClick(()=>{
                      if (this.tupian1==1){
                        this.picture1 = $r('app.media.aixin1')
                        this.tupian1=0
                      } else {
                        this.picture1 = $r('app.media.aixin')
                        this.tupian1=1
                      }

                    })
                    Text(`${item.createdAt}`).fontWeight(FontWeight.Bold)
                  }.height(20).width('100%').justifyContent(FlexAlign.End)

                  Row() {
                    Text('————————————————————')
                  }.height(10).width('100%').justifyContent(FlexAlign.End)
                }
              }.width('100%')
            }.width('100%')
            .padding({ left: 20, right: 20 })
          })
        }.width('100%').layoutWeight(1)
        .onReachStart(() => {
          this.getData() // 获取数据
        })
        .onReachEnd(() => {
          this.getData() // 获取数据
        })

      }.width('100%').height('auto')
      }}.width('100%').height('100%')
  }



}
