package com.etu003184.entity;

public class Emp {
    int id;
    String name;
    Dept[] dept;

    public Emp() {
    }

    public Emp(int id, String name, Dept[] dept) {
        this.id = id;
        this.name = name;
        this.dept = dept;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Dept[] getDept() {
        return dept;
    }

    public void setDept(Dept[] dept) {
        this.dept = dept;
    }
}