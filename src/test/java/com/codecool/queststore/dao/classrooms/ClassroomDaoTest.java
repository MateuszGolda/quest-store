package com.codecool.queststore.dao.classrooms;

import com.codecool.queststore.dao.DatabaseResetter;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ClassroomDaoTest {

    static DatabaseResetter databaseResetter;
    static ClassroomDao classroomDao;

    @BeforeAll
    static void init() {
        databaseResetter = new DatabaseResetter();
    }

    @BeforeEach
    void setUp() throws SQLException {
        databaseResetter.resetDatabase();
        classroomDao = new ClassroomDao("jdbc:h2:~/test_db", "test", "");
    }

    @Test
    void ShouldReturnAllClassrooms_When_GetAll(){
        Classroom classroom1 = new Classroom().setId(1).setName("JavaOOP");
        Classroom classroom2 = new Classroom().setId(2).setName("Web with SQL");
        Classroom classroom3 = new Classroom().setId(3).setName("ProgBasic");
        Classroom classroom4 = new Classroom().setId(4).setName("Advanced");
        Classroom classroom5 = new Classroom().setId(5).setName("Web with python");
        List<Classroom> classroomList = Arrays.asList(classroom1, classroom2, classroom3, classroom4, classroom5);
        assertEquals(classroomList.toString(), classroomDao.get("1=1").toString());
    }

    @Test
    void ShouldReturnEmptyList_When_GetNotExistingClassroom(){
        List<Classroom> classroomList = Collections.emptyList();
        assertEquals(classroomList.toString(), classroomDao.get("id=9999").toString());
    }

    @Test
    void ShouldReturnEmptyList_When_InvalidConditionPassed(){
        assertEquals(Collections.emptyList(), classroomDao.get("asdasdasd qweqw; 1235 124$%@!!^#*@"));
    }

    @Test
    void ShouldReturnTrue_When_InsertSuccessful(){
        Classroom classroom = new Classroom().setId(6).setName("Super-advanced");
        assertTrue(classroomDao.insert(classroom));
    }

    @Test
    void ShouldReturnInsertedClassroom_When_Insert(){
        Classroom classroom = new Classroom().setId(6).setName("sixth module");
        List<Classroom> classroomList = Collections.singletonList(classroom);
        classroomDao.insert(classroom);
        assertEquals(classroomList.toString(), classroomDao.get("id=6").toString());
    }

    @Test
    void ShouldThrowException_When_NullInsert(){
        assertThrows(NullPointerException.class, () -> classroomDao.insert(null));
    }

    @Test
    void ShouldReturnTrue_When_UpdateSuccessful(){
        Classroom classroom = new Classroom();
        assertTrue(classroomDao.update(classroom));
    }

    @Test
    void ShouldReturnUpdatedObject_When_UpdateSuccessful(){
        Classroom classroom = new Classroom().setId(1).setName("updated name");
        List<Classroom> classroomList = Collections.singletonList(classroom);
        classroomDao.update(classroom);
        assertEquals(classroomList.toString(), classroomDao.get("id=1").toString());
    }

    @Test
    void ShouldReturnTrue_When_DeleteSuccessful(){
        Classroom classroom = new Classroom().setId(1).setName("JavaOOP");
        assertTrue(classroomDao.delete(classroom));
    }
}