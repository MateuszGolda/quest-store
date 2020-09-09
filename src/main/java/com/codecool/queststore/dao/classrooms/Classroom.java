package com.codecool.queststore.dao.classrooms;

public class Classroom {

    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public Classroom setId(int id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Classroom setName(String name) {
        this.name = name;
        return this;
    }

    @Override
    public String toString() {
        return "Classroom{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
