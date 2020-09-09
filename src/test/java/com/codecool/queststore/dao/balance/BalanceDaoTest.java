package com.codecool.queststore.dao.balance;

import com.codecool.queststore.dao.DatabaseResetter;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class BalanceDaoTest {

    static DatabaseResetter databaseResetter;
    static BalanceDao balanceDao;

    @BeforeAll
    static void init() {
        databaseResetter = new DatabaseResetter();
    }

    @BeforeEach
    void setUp() throws SQLException {
        databaseResetter.resetDatabase();
        balanceDao = new BalanceDao("jdbc:h2:~/test_db", "test", "");
    }

    @Test
    void ShouldReturnAllBalances_When_GetAll(){
        List<Balance> balanceList = Collections.singletonList(new Balance().setAmount(1000).setTotalEarned(2000).setUserId(1));
        assertEquals(balanceList.toString(), balanceDao.get("1=1").toString());
    }

    @Test
    void ShouldReturnEmptyList_When_GetNotExistingBalance(){
        List<Balance> balanceList = Collections.emptyList();
        assertEquals(balanceList.toString(), balanceDao.get("user_id=9999").toString());
    }

    @Test
    void ShouldReturnEmptyList_When_InvalidConditionPassed(){
        assertEquals(Collections.emptyList(), balanceDao.get("asdasdasd qweqw; 1235 124$%@!!^#*@ throw-exception"));
    }

    @Test
    void ShouldReturnTrue_When_InsertSuccessful(){
        Balance balance = new Balance().setAmount(1000).setTotalEarned(2000).setUserId(1);
        assertTrue(balanceDao.insert(balance));
    }

    @Test
    void ShouldReturnInsertedBalance_When_Insert(){
        Balance balance = new Balance();
        List<Balance> balanceList = Collections.singletonList(balance);
        balanceDao.insert(balance);
        assertEquals(balanceList.toString(), balanceDao.get("user_id=0").toString());
    }

    @Test
    void ShouldThrowException_When_NullInsert(){
        assertThrows(NullPointerException.class, () -> balanceDao.insert(null));
    }

    @Test
    void ShouldReturnTrue_When_UpdateSuccessful(){
        Balance balance = new Balance().setAmount(5000).setTotalEarned(2000).setUserId(1);
        assertTrue(balanceDao.update(balance));
    }

    @Test
    void ShouldReturnFalse_When_UpdateUnsuccessful(){
        Balance balance = new Balance().setUserId(1);
        List<Balance> balanceList = Collections.singletonList(balance);
        balanceDao.update(balance);
        assertEquals(balanceList.toString(), balanceDao.get("user_id=1").toString());
    }

    @Test
    void ShouldReturnTrue_When_DeleteSuccessful(){
        Balance balance = new Balance().setAmount(1000).setTotalEarned(2000).setUserId(1);
        assertTrue(balanceDao.delete(balance));
    }
}