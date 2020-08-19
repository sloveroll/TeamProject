package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReviewDao;
import com.study.springboot.dto.PagingDto;
import com.study.springboot.dto.ReviewDto;

@Service
public class ReviewService implements IReviewService {

	@Autowired
	IReviewDao Reviewdao;
    //리뷰글목록
	@Override
	public List<ReviewDto> Reviewlist() {

		return Reviewdao.ReviewlistDao();
	}
    //리뷰글보기
	@Override
	public ReviewDto review(String review_idx) {

		return Reviewdao.ReviewDao(review_idx);
	}
	
	 //리뷰글작성
    @Override
    public int reviewWrite(Map<String, String> map) {
       int nResult = Reviewdao.reviewWriteDao(map);
       return nResult;
    }
    
    //리뷰글수정
    @Override
    public int reviewModify(Map<String, String> map) {
       int nResult = Reviewdao.reviewModifyDao(map);
       return nResult;
    }
    
    //리뷰글삭제
	@Override
    public int reviewDelete(String review_idx) {
        int nResult = Reviewdao.reviewDeleteDao(review_idx);
        return nResult;
     }
    
   


	// 제품리뷰 게시물 총 갯수
	@Override
	public int ReviewcountBoard() {
		return Reviewdao.ReviewcountBoardDao();
	}

	// 제품리뷰 페이징 처리 게시글 조회

	@Override
	public List<ReviewDto> ReviewPaging(PagingDto dto) {
		return Reviewdao.ReviewPagingDao(dto);
	}

	
	
	
}