## /utils

### /weather 天气接口

* pos 对应区域编号

### /lunar 日历接口

### /posInfo 经纬度转位置信息

* String longitude 经度
* String latitude 纬度

### /busIfo 公交接口（旧）

* String origin 起始地点
* String destination 目的地
* String city 城市名字（中文）

---

### 公交接口（新）的一系列接口

新公交接口使用

按顺序调用



/getAnsInfo

* String city, String origin, String destination (城市， 出发地点， 目标地点)

* 返回参数说明

|              | 名称        | 类型                                         | 说明              |
| :----------- | :---------- | :------------------------------------------- | :---------------- |
|              | return_code | string                                       | ok正常，error出错 |
|              | error_code  | string                                       | 错误代码，0正常   |
|              | sta_station | string                                       | 起始地址          |
|              | end_station | string                                       | 目的地地址        |
|              | returl_list | array                                        | 返回结果          |
| ├ xcdist     | string      | 全程距离                                     |                   |
| ├ xcprice    | string      | 价格                                         |                   |
| ├ xydurtime  | string      | 时间                                         |                   |
| ├ xywalkdist | string      | 步行距离                                     |                   |
| ├ xytitle    | array       | 线路                                         |                   |
|              | lineinfo    | array                                        | 站点详情信息      |
| ├ stype      | int         | 类型：1上车点，2换乘或步行，3途经点，4下车点 |                   |

* 示例

* 福州市、福州大学、福建师范大学

* ```json
  {
    "code": 1,
    "msg": null,
    "data": {
      "end_station": "福州大学",
      "returl_list": [
        {
          "lineinfo": [
            {
              "msg": "步行913m 约13分钟",
              "stype": 2
            },
            {
              "msg": "上车站点",
              "staname": "广贤路",
              "stype": 1,
              "hcbus": "168路/大学城二号环线"
            },
            {
              "msg": "途经站点",
              "staname": "学府南路",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城工程学院南区",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城福建工程学院",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "学府桥头",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城工程学院西门",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "岐头村",
              "stype": 3
            },
            {
              "msg": "下车站点",
              "staname": "医大附三医院",
              "stype": 4
            },
            {
              "msg": "步行1115m 约16分钟",
              "stype": 2
            }
          ],
          "xcprice": "1元",
          "xcdist": "5.7km",
          "xydurtime": "50分钟",
          "xywalkdist": "2028m",
          "xytitle": "168路/大学城二号环线"
        },
        {
          "lineinfo": [
            {
              "msg": "步行772m 约11分钟",
              "stype": 2
            },
            {
              "msg": "上车站点",
              "staname": "大学城师大东门",
              "stype": 1,
              "hcbus": "765路/330路"
            },
            {
              "msg": "途经站点",
              "staname": "师大学生公寓",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城客运西站",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "福建省档案馆(建平村)",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城一中校区",
              "stype": 3
            },
            {
              "msg": "下车站点",
              "staname": "福大新区东门",
              "stype": 4
            },
            {
              "msg": "步行1114m 约16分钟",
              "stype": 2
            }
          ],
          "xcprice": "2元",
          "xcdist": "6.1km",
          "xydurtime": "55分钟",
          "xywalkdist": "1886m",
          "xytitle": "765路/330路"
        },
        {
          "lineinfo": [
            {
              "msg": "步行761m 约11分钟",
              "stype": 2
            },
            {
              "msg": "上车站点",
              "staname": "大学城师大东门",
              "stype": 1,
              "hcbus": "198路"
            },
            {
              "msg": "途经站点",
              "staname": "新洲村",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "创新路西",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "高新海西中科院东门",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "高新区管委会",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城客运西站",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "明德旗山大道路口",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城体育中心",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "明德学府路口",
              "stype": 3
            },
            {
              "msg": "下车站点",
              "staname": "医大附三医院",
              "stype": 4
            },
            {
              "msg": "步行1131m 约16分钟",
              "stype": 2
            }
          ],
          "xcprice": "1元",
          "xcdist": "7km",
          "xydurtime": "60分钟",
          "xywalkdist": "1892m",
          "xytitle": "198路"
        },
        {
          "lineinfo": [
            {
              "msg": "步行914m 约13分钟",
              "stype": 2
            },
            {
              "msg": "上车站点",
              "staname": "广贤路",
              "stype": 1,
              "hcbus": "48路"
            },
            {
              "msg": "途经站点",
              "staname": "学府南路",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城工程学院南区",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城福建工程学院",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "学府桥头",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城工程学院西门",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "岐头村",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "明德学府路口",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "大学城体育中心",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "福州一中大学城校区",
              "stype": 3
            },
            {
              "msg": "途经站点",
              "staname": "上街浦口",
              "stype": 3
            },
            {
              "msg": "下车站点",
              "staname": "福大新区东门",
              "stype": 4
            },
            {
              "msg": "步行1122m 约16分钟",
              "stype": 2
            }
          ],
          "xcprice": "1元",
          "xcdist": "8.5km",
          "xydurtime": "60分钟",
          "xywalkdist": "2036m",
          "xytitle": "48路"
        }
      ],
      "sta_station": "福建师范大学",
      "error_code": "0",
      "return_code": "ok"
    },
    "map": {}
  }
  ```





* 用户选择方案后调用

/getBusInfo

* String city, String keywords (城市， 公交编号如 (3) 代表3路公交(有些公交查不到，需要检查返回数据))
* 返回参数说明

| 名称            | 类型        | 说明     |                   |
| :-------------- | :---------- | :------- | ----------------- |
|                 | return_code | string   | ok正常，error出错 |
|                 | error_code  | string   | 错误代码，0正常   |
|                 | returl_list | array    | 搜索公交结果      |
| ├ bus_stastan   | string      | 起始站   |                   |
| ├ bus_endstan   | string      | 终点站   |                   |
| ├ bus_linestrid | string      | 路线ID   |                   |
| ├ bus_linenum   | string      | 路线编号 |                   |
| ├ bus_staname   | string      | 路线名称 |                   |

* 示例

* 福州市、168

* ```json
  {
    "code": 1,
    "msg": null,
    "data": {
      "returl_list": [
        {
          "bus_linenum": "r45566",
          "bus_endstan": "公交大学城总站",
          "bus_stastan": "金牛山公园",
          "bus_linestrid": "NTkxMTk2NzA3OTg1",
          "bus_staname": "168路"
        }
      ],
      "error_code": "0",
      "return_code": "ok"
    },
    "map": {}
  }
  ```





* 拿到 路线ID，路线编号，路线名称 进行下一步调用

/getBusPos

* String city, String busLineId, String busLineNum, String busLineName (城市，路线ID，路线编号，路线名称)
* 返回参数说明

| return_code    | string      | ok正常，error出错                                            |                 |
| -------------- | ----------- | ------------------------------------------------------------ | --------------- |
|                | error_code  | string                                                       | 错误代码，0正常 |
|                | returl_list | array                                                        | 返回结果集      |
|                | lineinfo    | array                                                        | 路线信息        |
| ├ bus_staname  | string      | 路线名称                                                     |                 |
| ├ sta_sta      | string      | 起始站                                                       |                 |
| ├ end_sta      | string      | 终点站                                                       |                 |
| ├ fir_time     | string      | 首班车时间                                                   |                 |
| ├ end_time     | string      | 末班车时间                                                   |                 |
| ├ bus_money    | string      | 票价                                                         |                 |
| ├ other_lineid | string      | 反向路线ID（用于查询反向实时路线信息）                       |                 |
|                | stations    | array                                                        | 站点信息        |
| ├ bus_staname  | string      | 站点名称                                                     |                 |
|                | buses       | array                                                        | 公交位置        |
| ├ lating       | string      | 纬度                                                         |                 |
| ├ longing      | string      | 经度                                                         |                 |
| ├ distance     | int         | 距离（米）                                                   |                 |
| ├ dis_stat     | int         | 距第几个站点（如：2，距离第2个站还有distance米，distance是0为已到站！） |                 |



* 最后具体时间根据站台距离 / 公交速度即可、后端不再处理

* 示例

* 福州市、NTkxMTk2NzA3OTg1、r45566、168路

* ```json
  {
    "code": 1,
    "msg": null,
    "data": {
      "returl_list": {
        "lineinfo": {
          "fir_time": "06:30",
          "sta_sta": "金牛山公园",
          "end_sta": "公交大学城总站",
          "other_lineid": "NTkxMTk2NzA3OTg0",
          "end_time": "19:00",
          "bus_money": "1元",
          "bus_staname": "168路"
        },
        "buses": [
          {
            "distance": 447,
            "dis_stat": 5,
            "lating": 26.0761,
            "longing": 119.25691666666667
          },
          {
            "distance": 0,
            "dis_stat": 20,
            "lating": 26.076183333333333,
            "longing": 119.25688333333333
          }
        ],
        "stations": [
          {
            "bus_staname": "金牛山公园"
          },
          {
            "bus_staname": "洪山桥"
          },
          {
            "bus_staname": "神蜂科技"
          },
          {
            "bus_staname": "农林大学南门"
          },
          {
            "bus_staname": "洪塘大桥西"
          },
          {
            "bus_staname": "余盛"
          },
          {
            "bus_staname": "上街环岛"
          },
          {
            "bus_staname": "余盛永辉"
          },
          {
            "bus_staname": "美垱口"
          },
          {
            "bus_staname": "国宾大道源通路口"
          },
          {
            "bus_staname": "銮浦（省第三人民医院）"
          },
          {
            "bus_staname": "福建中医药大学东门"
          },
          {
            "bus_staname": "福建中医药大学"
          },
          {
            "bus_staname": "省医科大学新区"
          },
          {
            "bus_staname": "江夏学院"
          },
          {
            "bus_staname": "上街岐安"
          },
          {
            "bus_staname": "袁岐"
          },
          {
            "bus_staname": "医大附三医院"
          },
          {
            "bus_staname": "岐头村"
          },
          {
            "bus_staname": "大学城工程学院西门"
          },
          {
            "bus_staname": "学府桥头"
          },
          {
            "bus_staname": "大学城福建工程学院"
          },
          {
            "bus_staname": "大学城工程学院南区"
          },
          {
            "bus_staname": "学府南路"
          },
          {
            "bus_staname": "广贤路"
          },
          {
            "bus_staname": "大学城师大西门"
          },
          {
            "bus_staname": "公交大学城总站"
          }
        ]
      },
      "error_code": "0",
      "return_code": "ok"
    },
    "map": {}
  }
  ```

---

### /utils/getPosList

* String city 所在城市
* String keywords 地点关键词

## /common

### [/common/textUpload](http://47.100.226.180:3002/swagger-ui.html#/operations/common-controller/uploadUsingGET) 文字转方言

* String role 语言类型
* String text 文本

### [/common/textDownload](http://47.100.226.180:3002/swagger-ui.html#/operations/common-controller/downloadUsingGET)  获取方言mp3文件

* 回显一个mp3文件

### [/common/soundDownload](http://47.100.226.180:3002/swagger-ui.html#/operations/common-controller/soundDownloadUsingPOST)  获取对应语音文件对应文本

* 传入 pcm | wav 格式的文件

 
