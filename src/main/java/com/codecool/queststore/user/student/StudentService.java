package com.codecool.queststore.user.student;

public class StudentService {
    public Wallet getWallet(String json) {
        return null;
    }

    public void buyArtifact(String json) {

    }

    public String getExperienceLevel(String json) {
        return null;
    }

    public Student getStudentInfo(String session) {
        return new StudentDao().getUserBySession();
    }
}