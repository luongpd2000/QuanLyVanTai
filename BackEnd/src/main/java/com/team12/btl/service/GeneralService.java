package com.team12.btl.service;


import java.util.List;

public interface GeneralService<T>  {

    List<T> findAll();

    T findById(Integer id);

    T create(T t);

    boolean update(T t);

    boolean delete(Integer id);

}
