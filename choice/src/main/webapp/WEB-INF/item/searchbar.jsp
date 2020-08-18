<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 검색창 인클루드용 -->
 <div class="col-md-4 col-sm-12" >
            <form action="/search" method="GET" > 
               <div class="input-group"  style="border-bottom: 4px solid orange;">
                  <input type="text" class="form-control" name="searchWord" placeholder="Search" id="txtSearch " 
                  style="width: 50px; border: none;  margin-top: 30px;"/>
                 
                    <button class="btn input-group-addon" type="submit"  style=" margin-top: 25px;">
                      <span class="input-group-addon">
                        <i class="fas fa-search" style="color: orange; font-size: 30px;"></i></span></button>
               </div>
                     </form>
       
            </div>  

</body>
</html>