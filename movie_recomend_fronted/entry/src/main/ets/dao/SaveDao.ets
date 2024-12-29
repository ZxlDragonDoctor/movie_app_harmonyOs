import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';
import { MoveNote } from '../beans/MoveNote';
import { User } from '../beans/User';

class SavDAO{
  startflush(loginUser:User,movieid:number):Promise<Boolean>{
    return new Promise((resolve,reject)=>{
      var htttpRequest = http.createHttp()
      htttpRequest.request('http://192.168.71.237:9090/zxl/favorite/justy',{
        method:http.RequestMethod.POST,
        extraData:{
          user:loginUser,
          movieid:movieid
        }
      }).then(response =>{
        let data = JSON.parse(response.result.toString());
        console.log("接收到的code:",data.code);
        if(data.code == "10000"){
          console.log("刷新收藏成功");
          resolve(true);
        }else {
          console.log("刷新收藏失败");
          resolve(false)
        }
      })
    })
  }

  save(lognUser:User,movieid:number){
      return new Promise((resolve,reject)=>{
        var htttpRequest = http.createHttp()
        htttpRequest.request('http://192.168.71.237:9090/zxl/favorite/save',{
          method:http.RequestMethod.POST,
          extraData:{
            user:lognUser,
            movieid:movieid
          }
        }).then(response =>{
          console.log("this responseCode=",response.responseCode);
          let data = JSON.parse(response.result.toString());
          console.log("接收到的code:",data.code);
          if(data.code == "10000"){
            promptAction.showToast({
              message:"收藏成功",
              duration:5000,
              bottom:440
            })
          }else {
            promptAction.showToast({
              message:"收藏失败",
              duration:5000,
              bottom:440
            })
          }
        })
      })
  }
  remove(lognUser:User,movieid:number){
    return new Promise((resolve,reject)=>{
      var httpRequest = http.createHttp()
      httpRequest.request('http://192.168.71.237:9090/zxl/favorite/remove',{
        method:http.RequestMethod.POST,
        extraData:{
          user:lognUser,
          movieid:movieid
        }
      }).then(response =>{
        console.log("this responseCode=",response.responseCode);
        let data = JSON.parse(response.result.toString());
        console.log("接收到的code:",data.code);
        if(data.code == "10000"){
          promptAction.showToast({
            message:"取消收藏成功",
            duration:5000,
            bottom:440
          })
        }else {
          promptAction.showToast({
            message:"取消收藏失败",
            duration:5000,
            bottom:440
          })
        }
      })
    })
  }

  select(loginUser:User):Promise<MoveNote[]>{
    return new Promise((resolve,reject)=>{
      var httpRequest = http.createHttp()
      httpRequest.request('http://192.168.71.237:9090/zxl/favorite/selectFav',{
        method:http.RequestMethod.POST,
        extraData:{
          username:loginUser.getUsername(),
          password:loginUser.getPassword()
        }
      }).then(response => {
        console.log("this responseCode=", response.responseCode);
        let data = JSON.parse(response.result.toString());
        console.log("接收到的code:", data.code);
        if (data.code == "10000") {
          console.log("查询成功");
          resolve(data.data);
        } else {
          console.log("查询失败");
          resolve(null)
        }
      })
    })
  }

}

export default SavDAO;