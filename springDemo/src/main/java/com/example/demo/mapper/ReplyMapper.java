package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReplyVO;

@Mapper 
public interface ReplyMapper {
	
	// 게시판 번호를 가지고 그 번호에 등록된 모든 댓글목록을 가져오는 메소드 
	List<ReplyVO> reply_read(int r_board_num);	
	int reply_insert(ReplyVO reply);
	int reply_delete(int reply_num);
	// 댓글 번호를 가지고 하나의 댓글 정보르 가져오는 메소드 
	ReplyVO selectReplyNum(int reply_num);
}
