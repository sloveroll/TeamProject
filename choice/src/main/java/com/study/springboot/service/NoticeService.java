package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.PagingDto;

//@Service, Controller, @Repository가 동일한 기능을 한다. 저장소
//해당 클래스의 객체들을 빈으로 등록하고 만들 때 사용
@Service
public class NoticeService implements INoticeService {

	// 객체면 Autowired 변수면 bean 자동생성
	@Autowired
	INoticeDao Noticedao;
	// 이 자리에 여러 DAO들을 등록하고 관리하겠다.
	// 여러 테이블의 여러 트랜잭션들을 수행하게 된다.

	//공지글목록
	@Override
	public List<NoticeDto> Noticelist() {

		return Noticedao.NoticelistDao();
	}

	//공지글보기
	@Override
	public NoticeDto Noticeview(String notice_idx) {
		// 조회수 : view로 넘어가야 idx=데이터idx 값을 받기 때문에 view에 집어넣어줘야함.
		Noticedao.NoticehitDao(notice_idx);
		return Noticedao.NoticeviewDao(notice_idx);
	}
	
	 //공지글작성
    @Override
    public int Noticewrite(Map<String, String> map) {
       int nResult = Noticedao.NoticewriteDao(map);
       return nResult;
    }
    
    //공지글수정
    @Override
    public int Noticemodify(Map<String, String> map) {
       int nResult = Noticedao.NoticemodifyDao(map);
       return nResult;
    }
    
    //공지글삭제
    public int Noticedelete(String notice_idx) {
        int nResult = Noticedao.NoticedeleteDao(notice_idx);
        return nResult;
     }

	// 공지조회수 : void기때문에 return값 없음.
	@Override
	public void Noticehit(String notice_idx) {

	}

	// 공지게시물 총 갯수
	@Override
	public int countBoard() {
		return Noticedao.countBoardDao();
	}

	// 공지페이징 처리 게시글 조회

	@Override
	public List<NoticeDto> NoticePaging(PagingDto dto) {
		return Noticedao.NoticePagingDao(dto);
	}

}