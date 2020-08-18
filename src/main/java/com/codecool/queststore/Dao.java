package com.codecool.queststore;

import java.util.List;

public interface Dao<T> {
    List<T> get(String condition);

    boolean insert(T t);

    boolean update(T t);

    boolean delete(T t);
}
