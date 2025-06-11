package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum Transaction {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem");
    private String transactionName;
    Transaction(String transaction) {this.transactionName = transaction;}
    public String getTransaction() {return transactionName;}

    public static Map<String,String> getTransactionType() {
        Map<String,String> map=new HashMap<String,String>();
        for(Transaction it:Transaction.values()) {
            map.put(it.toString(), it.getTransaction());
        }
        return map;
    }
}
