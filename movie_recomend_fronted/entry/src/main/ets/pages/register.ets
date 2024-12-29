import promptAction from '@ohos.promptAction';
import { User } from '../beans/User';
import  UserDAO from '../dao/userDAO';
@Entry
@Component
struct RegisterPage {
  @State username: string = '';
  @State password: string = '';
  @State confirmPassword: string = '';
  @State icon:Resource = $r('app.media.icon')
  @State userDAO:UserDAO = new UserDAO();

  build() {
    Column({ space: 20 }) {
      Text('注册')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 40 })
        .fontColor(Color.Gray)

      TextInput({ placeholder: '用户名' })
        .width('80%')
        .height(50)
        .borderWidth(1)
        .placeholderColor(Color.Pink)
        .borderColor('#ccc')
        .fontColor(Color.Pink)
        .padding(10)
        .onChange((value) => this.username = value)

      TextInput({ placeholder:'密码'}).type(InputType.Password)
        .width('80%')
        .placeholderColor(Color.Pink)
        .fontColor(Color.Pink)
        .height(50)
        .borderWidth(1)
        .borderColor('#ccc')
        .padding(10)
        .onChange((value) => this.password = value)

      TextInput({ placeholder: '确认密码'}).type(InputType.Password)
        .width('80%')
        .placeholderColor(Color.Pink)
        .fontColor(Color.Pink)
        .height(50)
        .borderWidth(1)
        .borderColor('#ccc')
        .padding(10)
        .onChange((value) => this.confirmPassword = value)

      Button('注册')
        .width('80%')
        .height(50)
        .backgroundColor('#007AFF')
        .fontColor('#FFFFFF')
        .onClick(() => this.onRegister())
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundImage($r('app.media.shenlilianhua1'))
    .backgroundImageSize(ImageSize.Cover)

  }

  onRegister() {
    if (this.password !== this.confirmPassword) {
      promptAction.showToast({
        message: '两次输入的密码不一致',
        duration: 2000
      });
      return;
    }
    this.userDAO.register(new User(this.username,this.password,this.confirmPassword));
    console.log(`注册用户: ${this.username}, 密码: ${this.password}`);
    promptAction.showToast({
      message: '注册成功',
      duration: 2000
    });
  }
}
