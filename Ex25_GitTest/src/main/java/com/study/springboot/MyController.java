package com.study.springboot;

public class MyController {
	
		//수정작업 개발자 A
		//Git Test 
		//Git 사용하는 장점
		//1. 소스 안전 관리
		//2. 히스토리 관리가 가능하다 - 수정/추가/삭제/변경 기록이 다 남음.
		//3. 팀 작업 용이
	
		
		//프로젝트 소스 폴더
		//	|		    ▲
		//	▼  commit   | fetch
		//로컬 PC 저장소
		//	|		 ▲
		//	▼  push  | pull
		//원격 저장소(Github 서버)
		
		//add an existing local git repository 로컬 저장소선
		//Clone : 복제 ( 서버저장소를 로컬에 복제함.)
			//Master : 최상단 소스 노드
			//Branch : 가지치기 master ------------------->
			//							|			   ^ merge
			//							---> branch -- |
	
		// 수정 -> commit : 로컬저장소에 저장
		// push : 서버에 올리기
		//window-view - Gitstaging 커밋 메세지 작성후 올리기
	
		//같은 폴더나 파일을 개발자A,B가 동시에 수정하는 일을 줄여야
		//충돌(Comflict)를 없앨 수 있다.
		//개발자간에 의사소통을 통해서 동시 편집을 안해야 함
		//꼭 같은 파일이나 폴더를 수정해야 된다. 개발자 A가 Push하고
		//개발자 B가 pull한다. (pull하기 전에 개발자 A는 대기하고 있다가,
		//개발자 B가 push하고 나서 pull한 다음에 작업을 진행 하면 된다.
		//2.
		//개발자는 Push하고 나면 꼭 팀원들에게 공지하고, 
		//팀원들이 빨리 pull 해서
		//build해보고, 문제 유무를 확인하고
		//다음 작업을 진행하면 됨
		// * 먼저 push한 사람이 장땡이다!
	//eeee
}
