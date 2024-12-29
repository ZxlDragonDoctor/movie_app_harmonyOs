import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';
import { MoveNote } from '../beans/MoveNote';


class MoveDAO {
  getNotes(): Promise<MoveNote[]> {
    return new Promise((resolve,reject)=>{
      let httpRequest=http.createHttp()
      httpRequest.request('http://192.168.71.237:9090/zxl/movie/listMovie',
        {
          method:http.RequestMethod.GET
        }).then(reponse=>{
        console.log("响应体："+reponse.result.toString())
        let data=JSON.parse(reponse.result.toString())
        console.info("接收到的数据"+data.data)
        console.info("接收到的code"+data.code)
        if(data.code=="10000"){
          console.log('请求成功')
          resolve(data.data)
        }else{
          promptAction.showToast({
            message:"查询数据失败，检查网络"
          })
        }
      }).catch(()=>{
        promptAction.showToast({
          message:"网络请求失败,检查网络"
        })
      })
    })

  }

  remove(movieid:number): Promise<boolean> {
    return new Promise((resolve, reject) => {
      let httpRequest = http.createHttp()
      httpRequest.request('http://192.168.71.237:9090/zxl/movie/delete/' + movieid, {
        method: http.RequestMethod.DELETE
      }).then(response => {
        console.log("测试删除的响应体：" + response.result.toString())
        console.info("删除的接收到的code" + JSON.parse(response.result.toString()).code)
        if (JSON.parse(response.result.toString()).code == "10000") {
          resolve(JSON.parse(response.result.toString()).code)
        } else {
          let message = JSON.parse(response.result.toString()).message
          promptAction.showToast({
            message: message
          })
        }
      }).catch(() => {
        promptAction.showToast({
          message: '网络请求失败，请检查网络'
        })
      })
    })
  }

}

let moveDAO=new MoveDAO()
export default moveDAO