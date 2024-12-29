
import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
import { User } from '../beans/User'
import UserDAO from '../dao/userDAO'
@Entry
@Component
struct Login {
  @State user:User = new User("","")
  @State icon:Resource = $r('app.media.caoshen_icon')
  @State userDao:UserDAO = new UserDAO();
  /**
   * 登录页面
   */
  build() {
    Column({space:20}){
      // 头像
      Image(this.icon).width(80).height(80).borderRadius(80)
        .shadow({radius: 50,
          color: Color.Green,offsetX: 20,offsetY: 20,
        })
      //用户
      TextInput({placeholder:'请输入用户名'}).height(50).borderWidth(5).borderStyle(BorderStyle.Solid)
        .placeholderColor(Color.Blue)
        .fontColor(Color.Blue)
        .padding(10)
        .margin({left:20,right:20})
        .onChange(value =>{
          this.user.setUsername(value)
        })
        .onBlur(()=>{
          utils.justyNull(this.user.getUsername()=='',"用户名不能为空",2000)
        })

      TextInput({placeholder:'请输入密码'}).height(50).borderWidth(5).borderStyle(BorderStyle.Solid)
        .placeholderColor(Color.Blue)
        .fontColor(Color.Blue)
        .padding(10)
        .margin({left:20,right:20})
        .type(InputType.Password)
        .placeholderColor(Color.Blue)
        .onChange(value =>{
          console.log(value)
          this.user.setPassword(value)
        })
        .onBlur(()=>{
          utils.justyNull(this.user.getPassword()=='',"密码不能为空",2000)
        })

      Row({space:10}){

        Button("登录").width(100).height('50').margin(20)
          .fontWeight(30).onClick(()=>{
          if(this.user.getUsername())
          console.log('username=%s\n,this.password=%s',this.user.getUsername(),this.user.getPassword());
              this.userDao.login(this.user);
        })

        Button("注册").width(100).height('50').margin(20)
          .fontWeight(30).onClick(()=>{
          router.pushUrl({
            url:"pages/register"
          })
        })
      }
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r('app.media.caoshen'))
    .backgroundImageSize(ImageSize.Cover)
  }
}

class utils{
  public static justyNull(err:boolean,message:string,duration:number):void{
    if(err){
      promptAction.showToast({
        message:message,
        duration:duration
      })
    }
  }
}