package com.codecool.queststore.dao.balance;

public class Balance {
    private int userId;
    private int amount;
    private int totalEarned;

    public Balance(){
    }

    public Balance setUserId(int userId) {
        this.userId = userId;
        return this;
    }

    public Balance setAmount(int amount) {
        this.amount = amount;
        return this;
    }

    public Balance setTotalEarned(int totalEarned) {
        this.totalEarned = totalEarned;
        return this;
    }

    public int getUserId() {
        return userId;
    }

    public int getAmount() {
        return amount;
    }

    public int getTotalEarned() {
        return totalEarned;
    }

    @Override
    public String toString() {
        return "Balance{" +
                "userId=" + userId +
                ", amount=" + amount +
                ", totalEarned=" + totalEarned +
                '}';
    }
}
