package com.amazon.buyer.account.vo;

import java.io.Serializable;

/**
 * Created by User on 2017/7/11.
 */
public class BuyerUserVo implements Serializable{

    private String account;

    private String oldPwd;

    private String newPwd;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getOldPwd() {
        return oldPwd;
    }

    public void setOldPwd(String oldPwd) {
        this.oldPwd = oldPwd;
    }

    public String getNewPwd() {
        return newPwd;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }

}
