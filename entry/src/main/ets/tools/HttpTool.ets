import http from '@ohos.net.http';

class HttpTool {
  /**
   * @param url 接口地址
   * @param fn  回调函数
   */
  get(url: string, fn: Function) {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
      header: {
        'X-Auth-Token': globalThis.hw_token
      }
    }
    httpRequest.request(url, options, (err, data) => {
      if (!err) {
        // 调用外层传入进来的回调函数，将api-data作为参数传入到回调函数中，为回调函数中定义的方法参数赋值
        fn(data)
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }

  /**
   *
   * @param url 接口地址
   * @param params 请求参数
   * @param fn  回调函数
   */
  post(url: string, params: object, fn: Function) {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: params,
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
      header: {
        'X-Auth-Token': globalThis.hw_token
      }
    }
    httpRequest.request(url, options, (err, data) => {
      if (!err) {
        // 调用外层传入进来的回调函数，将api-data作为参数传入到回调函数中，为回调函数中定义的方法参数赋值
        fn(data)
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }

  asyncGet(url: string) {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
      header: {
        'X-Auth-Token': globalThis.hw_token
      }
    }
    return httpRequest.request(url, options)
  }

  asyncPost(url: string, params: object) {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: params,
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
      header: {
        'Accept': 'application/json',
        'X-Auth-Token': globalThis.hw_token
      }
    }
    return httpRequest.request(url, options)
  }

  login_iot(url: string, params: object, fn: Function) {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: params,
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
    }
    httpRequest.request(url, options, (err, data) => {
      if (!err) {
        // 调用外层传入进来的回调函数，将api-data作为参数传入到回调函数中，为回调函数中定义的方法参数赋值
        fn(data)
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }

  getAccessToken(url: string) {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
    }
    return httpRequest.request(url, options)
  }
}

export default new HttpTool()