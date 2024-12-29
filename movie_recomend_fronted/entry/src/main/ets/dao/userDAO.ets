import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import { User } from '../beans/User';
class UserDAO{
  login(user:User):Promise<Boolean>{
    console.log(user.getUsername());
    return new Promise((resolve,reject)=>{
      var htttpRequest = http.createHttp()
      htttpRequest.request('http://192.168.71.237:9090/zxl/movieUser/login',{
        method:http.RequestMethod.POST,
        extraData:user
      }).then(response =>{
          console.log("this responseCode=",response.responseCode);
         let data = JSON.parse(response.result.toString())
        console.log("接收到的code:",data.code);
          if(data.code == "10000"){
            AppStorage.SetOrCreate("loginUser",user);
            console.log("user对象"+AppStorage.Get("loginUser"));
            promptAction.showToast({
              message:"登录成功",
              duration:5000,
              bottom:440
            })
            router.pushUrl({
              url:'components/movieShow',
            },router.RouterMode.Single,()=>{
              promptAction.showToast({
                message: "跳转成功",
                duration: 5000,
                bottom: 440
              })
            })
          }else {
            let imessage = JSON.parse(response.result.toString()).message;
            console.log(imessage);
            promptAction.showToast({
              message: imessage,
              duration: 5000,
              bottom: 440
            })
          }
      })
    })
  }
  register(user:User):Promise<Boolean>{
    console.log(user.getUsername());
    return new Promise((resolve,reject)=>{
      var htttpRequest = http.createHttp()
      htttpRequest.request('http://192.168.71.237:9090/zxl/movieUser/register',{
        method:http.RequestMethod.POST,
        extraData:user
      }).then(response =>{
        console.log("this responseCode=",response.responseCode);
        let data = JSON.parse(response.result.toString())
        console.log("接收到的code:",data.code);
        if(data.code == "10000"){
          promptAction.showToast({
            message:"注册成功",
            duration:5000,
            bottom:440
          })
          router.pushUrl({
            url:'pages/login',
          },router.RouterMode.Single,()=>{
            promptAction.showToast({
              message: "跳转成功",
              duration: 5000,
              bottom: 440
            })
          })
        }else {
          let imessage = JSON.parse(response.result.toString()).message;
          console.log(imessage);
          promptAction.showToast({
            message:imessage,
            duration:5000,
            bottom:440
          })
        }
      })
    })
  }

}

export default UserDAO;