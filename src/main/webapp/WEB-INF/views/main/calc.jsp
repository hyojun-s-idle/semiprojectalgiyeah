<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- <article class="main-pop-post-title-10"> -->
<article class="">

	<div class="calc">
		<!-- <form action="#"> -->
		<ul>
			<h1>주급 계산기</h1>
			<li><span>시급</span> <input type="text" id="wage" name="wage"
				placeholder="ex) 10000"></li>
			<li><span>일일 근무 시간</span> <input type="text" id="hour" class="hour11" 
				name="hour" placeholder="시간"><select name="min"
				id="min">
					<option value="0">분</option>
					<option value="0.5">30분</option>
			</select></li>

			<li><span>일주 근무 횟수</span> <select name="day" id="day">
					<option value="1">1일</option>
					<option value="2">2일</option>
					<option value="3">3일</option>
					<option value="4">4일</option>
					<option value="5">5일</option>
					<option value="6">6일</option>
					<option value="7">매 주</option>
			</select></li>

			<li><span>세금적용</span> <select name="tax" id="tax">
					<option value="0">없음</option>
					<option value="0.0932">4대 보험(9.32%)</option>
					<option value="0.033">소득세(3.3%)</option>
			</select></li>

			<li>
				<button id="btn">계산</button>
			</li>
			<li><span>나의 주급</span></li>
			<span id="result"></span>
		</ul>
	</div>
</article>
