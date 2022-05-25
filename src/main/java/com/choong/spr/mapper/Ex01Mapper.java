package com.choong.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.choong.spr.domain.ex01.BoardDto;

public interface Ex01Mapper {

	List<BoardDto> selectBoard();

	BoardDto getBoard(int id);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

	int insertBoard(BoardDto board);

	List<BoardDto> listBoardPage(@Param("from")int from, @Param("row")int row);

	int countBoardPage();

	

}
