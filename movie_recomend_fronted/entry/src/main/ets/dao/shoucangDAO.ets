import http from '@ohos.net.http'
import promptAction from '@ohos.promptAction'
import { shoucang } from '../beans/shoucang'

class pinglunDAO{
  getNotes(movieid:number):Promise<shoucang[]>{
    return new Promise((resolve,reject)=>{
      let httpRequest = http.createHttp()
      httpRequest.request("http://192.168.71.237:9090/zxl/review/get/"+movieid,{
        method:http.RequestMethod.GET
      }).then(response =>{
        console.log(response.result.toString());
        let data = JSON.parse(response.result.toString())
        console.log(data.code);
        if(data.code == "10000"){
          console.log("请求成功");
          resolve(data.data)
        }else {
          let imessage = JSON.parse(response.result.toString()).message;
          promptAction.showToast({
            message: imessage
          })
        }
      }).catch(()=>{
        promptAction.showToast({
          message: "网路请求失败，检查网络"
        })
      })

    })
  }
  save(username:string,movieid:number,content:string): Promise<boolean> {
    return new Promise((resolve,reject)=>{
      console.log("==========")
      console.log("username:"+username)
      console.log("movieid:"+movieid)
      console.log("content:"+content)
      let httpRequest = http.createHttp()
      httpRequest.request("http://192.168.71.237:9090/zxl/review/saveReview",{
        method:http.RequestMethod.POST,
        extraData:{
          username:username,
          movieid:movieid,
          content:content
        }
      }).then(response =>{
        let data = JSON.parse(response.result.toString())
        if(data.code == "10000"){
          console.log("保存成功");
          resolve(true)
        }else {
          let imessage = JSON.parse(response.result.toString()).message;
          promptAction.showToast({
            message: imessage
          })
          resolve(false)
        }
      })
    })
  }

}

export default new pinglunDAO();