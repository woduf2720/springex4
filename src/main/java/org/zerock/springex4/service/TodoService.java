package org.zerock.springex4.service;

import org.zerock.springex4.dto.PageRequestDTO;
import org.zerock.springex4.dto.PageResponseDTO;
import org.zerock.springex4.dto.TodoDTO;

import java.util.List;

public interface TodoService {
    void register(TodoDTO todoDTO);

    List<TodoDTO> getAll();

    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);

    TodoDTO getOne(Long tno);

    void remove(Long tno);

    void modify(TodoDTO todoDTO);
}
