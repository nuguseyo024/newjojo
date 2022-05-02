package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BoardVO;

@Mapper 
public interface BoardMapper {
		/*
		 * board 기능 
		 * 1. 글 쓰기 board_insert -- 필요 인자 : boardVO / 반환값 : int(실행 결과 : 성공/실패) 
		 * 2. 글 리스트 불러오기 board_getList -- 필요 인자 : x / 반환값 : boardVO(게시판 내용) 
		 * 3. 글 상세 불러오기 board_read -- 필요 인자 : board_num / 반환값 : boardVO(board_num에 해당하는 글 내용) 
		 * 4. 글 삭제 board_delete -- 필요 인자 : board_num / 반환값 : int(실행 결과 : 성공/실패) 
		 * 5. 글 수정 board_update -- 필요 인자 : boardVO / 반환값 : int(실행 결과 : 성공/실패) 
		 * 
		 * */

	   int board_insert(BoardVO board);
	   List<BoardVO> board_getList();
	   BoardVO board_read( int board_num);	   
	   int board_delete(int board_num);
	   int board_update(BoardVO bbs);
	   List<BoardVO>  board_search(String keyword);
}
