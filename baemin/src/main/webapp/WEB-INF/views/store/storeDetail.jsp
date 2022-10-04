<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/user/login.css">
 <div id="wrap">
	<input type="hidden" value="${storeInfo.storeIdn}"/>
    <nav>
    	<c:set var="info" value="${store.storeInfo}" />
        <h1 id="store_name" data-store_name="${storeInfo.storeName }" >${info.storeName }</h1>
        <%-- <div id="is_open" data-is_open="${store.storeInfo.isOpen }"></div> --%>
		<div class="inf">
			<div>
				<%-- 
				<span class="score_box">
             		<c:forEach begin="0" end="4" var="i">
             			<c:choose>
	           				<c:when test="${Math.round(info.score) > i }">
		                   		<i class="far fas fa-star"></i>
		                   	</c:when>
		                   	<c:otherwise>
		                   		<i class="far fa-star"></i>
		                   	</c:otherwise>
             			</c:choose> 
             		</c:forEach>
                  		
                  	<span class="store_score" data-score="${info.score }">${info.score }</span>
                  	
				</span><br>
                 --%>
                   
           		<span><i class="fas fa-heart" ></i> 찜 </span>
                   	
                    
                <span class="likes_count" data-count=0 >7</span>
                  
			</div>
               	<div>
               		<span>리뷰 ${storeInfo.reviewCount}</span>
            	</div>
                
               	<div id="min_delevery" data-min_delevery="${storeInfo.minDelevery}">최소주문금액 <fm:formatNumber value="${storeInfo.minDelevery}" pattern="###,###" />원</div>
               	<div>예상 배달시간 ${storeInfo.deleveryTime}분</div>
               	<div id="delevery_tip" data-delevery_tip="${storeInfo.deleveryTip}">배달팁 <fm:formatNumber value="${storeInfo.deleveryTip }" pattern="###,###" />원</div>
		</div>
    </nav>


	<!-- 모바일 카트 -->
   	<div class="m_cart_img">
   		<div class="m_cart_img_box">
   			<i class="fas fa-shopping-cart"></i>
   			<span class="m_cart_count"></span>
   		</div>
   	</div>
  	<!-- 모바일 카트 -->
    
    
    
	<!-- 장바구니 -->    
    <!-- <aside id="cart">
        <div class="cart">
            <h2>옵션</h2>
            <i class="far fa-trash-alt deleteAll" ></i>
            
            <div class="cart_list">
	            <ul>
	            	
					<li>
						<h3>메뉴</h3>
  							<div>가격</div>
  							<div>수량 : 0 </div>
  							<div> 옵션  </div>
  							<div>합계 : 0원</div>
  							<button class="cancle_btn"> ｘ </button> 
		            </li>
  							
	            </ul>
            </div>
            
            <div class="order_btn_box">
            	<div class="total">장바구니가 비었습니다.</div>
	            <button class="order_btn" disabled>리뷰작성</button>
				<h2 onclick="location.href='/review/form/${storeInfo.storeIdn}'">리뷰작성</h2>
            </div>
        </div>
        
    </aside>
    <div class="alarm">장바구니에 담았습니다</div> -->
	<!-- 장바구니 -->    
	   

	<main style=" margin-left: auto; margin-right: auto;">
		<div class="offset"></div>
        <ul class="tab ">
            <li class="select">메뉴</li>
            <li>정보</li>
            <li>리뷰</li>
        </ul>
	
			
		<!-- 메뉴 탭 -->	
        <ul class="menu">
			<c:if test="${not empty memberLists}">
				<c:forEach items="${menuLists}" var="menuList" >
					<li>
						<!-- <c:if test="${adminPage && SPRING_SECURITY_CONTEXT.authentication.principal.user.role == 'ROLE_ADMIN' }">
							<label class="menu_delete_label">
								<i class="fas fa-check-square" ></i>
								<input type="checkbox" class="menu_delete_checkbox" name="deleteNumber" value="${foodList.id }">
							</label>
						</c:if>
						-->

						<div class="menu_box">
							<div>
								<h2>${menuList.menuName } </h2>
								<fm:formatNumber value="${menuList.menuPrice}" pattern="###,###" />원 
							</div>
							
							<div>
								<img src="/upload/${menuList.imgPath }" alt="이미지">
								<button>장바구니에 담기</button> 
							</div>
						</div>
					</li>
	        	</c:forEach>
			</c:if>
			<c:if test="${empty menuLists }">
					<img class="temp_img" alt="이미지" src="/img/temp2.png">
					<style>main .box {background: #F6F6F6; width: 40%; }</style>
			</c:if>
        </ul>
		<!-- 메뉴 탭 -->	

		<!-- 정보 탭 -->
	    <ul class="info" >
			<li>
				<div>
					<h2>찾아 오시는 길</h2>
					
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 350px;"></div> 
						<!-- 지도타입 컨트롤 div 입니다 -->
						<div class="custom_typecontrol radius_border">
							<span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
							<span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
						</div>
						<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						<div class="custom_zoomcontrol radius_border"> 
							<span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
							<span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
						</div>
					</div>
					
					<h2>위치안내</h2>
					<div id="store_address" data-address="${info.storeAddress2 }">${info.storeAddress2 }  ${info.storeAddress3 }</div>
				</div>
			</li>
			 
			<li>
				<div>
				   <h2>가게 소개</h2>
				   <div>${storeInfo.storeIntro}</div>
			   </div>
			</li>
			 
			<li>
				<div>
					<h2>영업 정보</h2>
					
					<div class="info_detail_title">
						<div>상호명</div>
						<div>영업시간</div>
						<div>전화번호</div>
						
					</div>
					
					<div class="info_detail">
						<div>${storeInfo.storeName}</div>
						<div>
							<span><fm:formatNumber value="${info.openingTime }" minIntegerDigits="2" />3시 ~</span>
							<span><fm:formatNumber value="${info.closingTime }" minIntegerDigits="2" />15시 </span>
						</div>
						<div>${storeInfo.storePhonenum}</div>
						
					</div>
				</div>
			</li>
			 
			<li>
				<div>
					<h2>가계 통계</h2>
					<div class="info_detail_title">
						<div>전체 주문수</div>
						<div>전체 리뷰 수</div>
						<div>찜</div>
					</div>
					
					<div class="info_detail">
						<div>${storeInfo.orderCount}</div>
						<div>${storeInfo.reviewCount}</div>
						<div>7</div> 
					</div>
				</div>	
			</li>
			
	    </ul>
		<!-- 메뉴 탭 -->    
	
		
		
		<!-- 리뷰 탭 -->        
		<ul class="comment" >
			<li>
				<div class="score_info">
					<div>
						<!-- 리뷰 별점 평균(자연수) -->
						<div class="score">${scoreMap.averageScore}</div>
							   
						<div>
							<c:forEach begin="0" end="4" var="i">
								 <c:choose>
									   <c:when test="${scoreMap.averageScore > i }">
										   <i class="far fas fa-star"></i>
									   </c:when>
									   <c:otherwise>
										   <i class="far fa-star"></i>
									   </c:otherwise>
								 </c:choose>
							</c:forEach>
						</div>
					</div>
						
					<div class="score_count">
						<div> 
							<div>5점</div>
							
							<div class="">
								<div class="graph_background"></div>
								<!-- <div class="graph score5" data-score5="${scoreMap.fiveScore}"></div> -->
								<c:forEach begin="0" end="4" var="i">
									<c:choose>
										   <c:when test="${5 > i }">
											   <i class="far fas fa-star"></i>
										   </c:when>
										   <c:otherwise>
											   <i class="far fa-star"></i>
										   </c:otherwise>
									 </c:choose>
								</c:forEach>
							</div>
							<!-- 5점짜리 평균 -->
							<div class="review_count">${scoreMap.fiveScore}</div>
						</div>
						
						<div> 
							<div>4점</div>
							<div class="">
								<div class="graph_background"></div>
								<!-- <div class="graph score4" data-score4="${scoreMap.fourScore}"></div> -->
								<c:forEach begin="0" end="4" var="i">
									<c:choose>
										   <c:when test="${4 > i }">
											   <i class="far fas fa-star"></i>
										   </c:when>
										   <c:otherwise>
											   <i class="far fa-star"></i>
										   </c:otherwise>
									 </c:choose>
								</c:forEach>
							</div>
							<div class="review_count">${scoreMap.fourScore}</div>
						</div>
							
						<div> 
							<div>3점</div>
							<div class="">
								<div class="graph_background"></div>
								<!-- <div class="graph score3" data-score3="${scoreMap.threeScore}"></div> -->
								<c:forEach begin="0" end="4" var="i">
									<c:choose>
										   <c:when test="${3 > i }">
											   <i class="far fas fa-star"></i>
										   </c:when>
										   <c:otherwise>
											   <i class="far fa-star"></i>
										   </c:otherwise>
									 </c:choose>
								</c:forEach>
							</div>
							<div class="review_count">${scoreMap.threeScore}</div>
						</div>
						
						<div> 
							<div>2점</div>
							<div class="">
								<div class="graph_background"></div>
								<!-- <div class="graph score2" data-score2="${scoreMap.twoScore}"></div> -->
								<c:forEach begin="0" end="4" var="i">
									<c:choose>
										   <c:when test="${2 > i }">
											   <i class="far fas fa-star"></i>
										   </c:when>
										   <c:otherwise>
											   <i class="far fa-star"></i>
										   </c:otherwise>
									 </c:choose>
								</c:forEach>
							</div>
							<div class="review_count">${scoreMap.twoScore}</div>
						</div>
						
						<div> 
							<div>1점</div>
							<div class="">
								<div class="graph_background"></div>
								<!-- <div class="graph score1" data-score1="${scoreMap.oneScore} }"></div> -->
								<c:forEach begin="0" end="4" var="i">
									<c:choose>
										   <c:when test="${1 > i }">
											   <i class="far fas fa-star"></i>
										   </c:when>
										   <c:otherwise>
											   <i class="far fa-star"></i>
										   </c:otherwise>
									 </c:choose>
								</c:forEach>
							</div>
							<div class="review_count">${scoreMap.oneScore}</div>
						</div>
					</div>
				
				</div>
			</li>
			 
			<c:if test="${not empty reviewLists}">
				<c:forEach items="${reviewLists}" var="reviewList">
					<li>
						<div class="client">
							
							<div class="review_header">
								<div>
									<div class="nickname">${reviewList.reviewTitle}</div>
									<div>
										
										<c:forEach begin="0" end="4" var="i">
											<c:choose>
												<c:when test="${reviewList.reviewScore > i }">
													<i class="far fas fa-star"></i>
												</c:when>
												<c:otherwise>
													<i class="far fa-star"></i>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<span>${reviewList.regDate }</span>
									</div>
								</div>
							</div> 
								
							<div>
								<c:if test="${!empty reviewList.imgPath }">
									<div><img src="/upload/${reviewList.imgPath }" alt="이미지" class="review_img"></div>
								</c:if>
								<div>${reviewList.reviewContent } </div>
							</div>
						</div>
						
						
						<div class="boss">
							<c:if test="${!empty reviewList.bossComment }">	
								<div class="boss_comment_box">
									<div class="nickname">사장님</div>
									<div class="boss_comment">${reviewList.bossComment }</div>
								</div>
							</c:if>
						</div>
						
						
						<div class="boss input">
								<div class="boss_comment_box">
								<div class="nickname">사장님</div>
								<div class="boss_comment">
									<textarea class="comment_area" spellcheck="false"></textarea>
								</div>
								
								<div>
									<button class="boss_comment_btn reply" >댓글 달기</button>
									<input type="hidden" value="${reviewList.orderNum }" class="order_num">
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</c:if>
			<c:if test="${empty reviewLists}">
				<h1 style="text-align: center;">등록된 리뷰가 없습니다.</h2>
			</c:if>
		</ul>
		<button class="login_btn" onclick="location.href='/review/form/${storeInfo.storeIdn}'"
		style="width: 100%; height: 50px; font-size: 20px;">리뷰작성</button>
	</main>
</div>
	
	
	
	
	
	


 