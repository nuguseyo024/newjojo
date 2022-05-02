package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.FileVO;

@Mapper
public interface FileMapper {
	int file_insert(FileVO file);
	int file_delete(int file_num);
	int file_update(FileVO file);
	FileVO select_file_num (int file_num);
	List<FileVO> file_read(int f_board_num);
	int getMax();
	
}
