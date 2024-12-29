
import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
import { shuju } from '../beans/shuju'
import { User } from '../beans/User'
import pinglunDAO from '../dao/pinglunDAO'

@Entry
@Component
struct pinglun {
  @State note: shuju = new shuju()
  @State params: any =router.getParams()
  build() {
    Column() {
      Row() {
        Image($r('app.media.back')).height(30)
          .interpolation(ImageInterpolation.High).onClick(() => {
          router.back()
        })
        Text("评论页面").width(80).height(50)
          .fontSize(20).fontWeight(FontWeight.Bolder)
      }.width("100%")
      .height(80)
      .shadow({ radius: 10 })
      .padding(10)

      Row() {
        TextInput({ placeholder: '请输入评论' }).fontStyle(FontStyle.Italic)
          .borderColor(Color.Blue)
          .height(50)
          .onChange((value) => {
            this.note.content = value//获取用户输入的评论
          })
      }.width('100%').height(80)

      Row() {
        Button('提交评论').onClick(() => {
          // 发送保存请求
          pinglunDAO.save(AppStorage.Get<User>("loginUser").getUsername(),this.params.movieid,this.note.content).then(flag => {
            if (flag) {
              promptAction.showToast({ message: '保存成功' })
              router.back()
            } else {
              promptAction.showToast({ message: '保存失败' })
            }
          })
        })
      }.height(50)


    }
  }
}