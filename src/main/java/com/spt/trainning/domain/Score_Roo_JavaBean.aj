// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.trainning.domain;

import com.spt.trainning.domain.Account;
import com.spt.trainning.domain.Examination;
import com.spt.trainning.domain.Score;

privileged aspect Score_Roo_JavaBean {
    
    public Account Score.getAccount() {
        return this.account;
    }
    
    public void Score.setAccount(Account account) {
        this.account = account;
    }
    
    public Examination Score.getExamination() {
        return this.examination;
    }
    
    public void Score.setExamination(Examination examination) {
        this.examination = examination;
    }
    
    public String Score.getScore() {
        return this.score;
    }
    
    public void Score.setScore(String score) {
        this.score = score;
    }
    
}
