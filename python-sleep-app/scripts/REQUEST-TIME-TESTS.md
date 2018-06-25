# HTTP Request Timeout Test for Web App for Containers

## TEST1 : WEBSITES_CONTAINER_START_TIME_LIMIT default 230 sec
PARAMETERS:
- MYSLEEPTIME=350
- WEBSITES_CONTAINER_START_TIME_LIMIT=230

OUTCOME:
- request timeout after 4min (240 sec)
```
$ date; curl https://mysleepapp01.azurewebsites.net/sleep; date

2018年 6月26日 火曜日 00時42分48秒 JST <<<<<<<<<<
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<title>502 - Web server received an invalid response while acting as a gateway or proxy server.</title>
<style type="text/css">
<!--
body{margin:0;font-size:.7em;font-family:Verdana, Arial, Helvetica, sans-serif;background:#EEEEEE;}
fieldset{padding:0 15px 10px 15px;}
h1{font-size:2.4em;margin:0;color:#FFF;}
h2{font-size:1.7em;margin:0;color:#CC0000;}
h3{font-size:1.2em;margin:10px 0 0 0;color:#000000;}
#header{width:96%;margin:0 0 0 0;padding:6px 2% 6px 2%;font-family:"trebuchet MS", Verdana, sans-serif;color:#FFF;
background-color:#555555;}
#content{margin:0 0 0 2%;position:relative;}
.content-container{background:#FFF;width:96%;margin-top:8px;padding:10px;position:relative;}
-->
</style>
</head>
<body>
<div id="header"><h1>Server Error</h1></div>
<div id="content">
 <div class="content-container"><fieldset>
  <h2>502 - Web server received an invalid response while acting as a gateway or proxy server.</h2>
  <h3>There is a problem with the page you are looking for, and it cannot be displayed. When the Web server (while acting as a gateway or proxy) contacted the upstream content server, it received an invalid response from the content server.</h3>
 </fieldset></div>
</div>
</body>
</html>
2018年 6月26日 火曜日 00時46分48秒 JST  <<<<<<<<<<
```



## TEST2 : WEBSITES_CONTAINER_START_TIME_LIMIT 300 sec

PARAMETERS:
- MYSLEEPTIME=350
- WEBSITES_CONTAINER_START_TIME_LIMIT=300

OUTCOME:
- request timeout after 4min (240 sec)
```
# Warm up
$ date; curl https://mysleepapp01.azurewebsites.net/; date

# Test start
$ date; curl https://mysleepapp01.azurewebsites.net/sleep; date

2018年 6月26日 火曜日 01時00分03秒 JST <<<<<<<<<<
<!DOCTYPE html>
<html>
<head>
<title>Error</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>An error occurred.</h1>
<p>Sorry, the page you are looking for is currently unavailable.<br/>
Please try again later.</p>
<p>If you are the system administrator of this resource then you should check
the <a href="http://nginx.org/r/error_log">error log</a> for details.</p>
<p><em>Faithfully yours, nginx.</em></p>
</body>
</html>
2018年 6月26日 火曜日 01時04分04秒 JST <<<<<<<<<<
```



## TEST3: WEBSITES_CONTAINER_START_TIME_LIMIT 300 sec but MYSLEEPTIME=60

PARAMETERS:
- MYSLEEPTIME=60
- WEBSITES_CONTAINER_START_TIME_LIMIT=300

OUTCOME:
- request timeout after 1min (60 sec)
```
# Warm up
$ date; curl https://mysleepapp01.azurewebsites.net/; date

# Test start
$ date; curl https://mysleepapp01.azurewebsites.net/sleep; date

2018年 6月26日 火曜日 06時46分06秒 JST
Sorry for the late
2018年 6月26日 火曜日 06時47分06秒 JST
```