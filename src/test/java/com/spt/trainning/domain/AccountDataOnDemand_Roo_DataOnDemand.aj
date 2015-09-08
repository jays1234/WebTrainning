// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.trainning.domain;

import com.spt.trainning.domain.Account;
import com.spt.trainning.domain.AccountDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect AccountDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AccountDataOnDemand: @Component;
    
    private Random AccountDataOnDemand.rnd = new SecureRandom();
    
    private List<Account> AccountDataOnDemand.data;
    
    public Account AccountDataOnDemand.getNewTransientAccount(int index) {
        Account obj = new Account();
        setCode(obj, index);
        setCreatedBy(obj, index);
        setCreatedDate(obj, index);
        setPassword(obj, index);
        setStatus(obj, index);
        setUpdatedBy(obj, index);
        setUpdatedDate(obj, index);
        setUserRole(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void AccountDataOnDemand.setCode(Account obj, int index) {
        String code = "code_" + index;
        obj.setCode(code);
    }
    
    public void AccountDataOnDemand.setCreatedBy(Account obj, int index) {
        String createdBy = "createdBy_" + index;
        obj.setCreatedBy(createdBy);
    }
    
    public void AccountDataOnDemand.setCreatedDate(Account obj, int index) {
        Date createdDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedDate(createdDate);
    }
    
    public void AccountDataOnDemand.setPassword(Account obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void AccountDataOnDemand.setStatus(Account obj, int index) {
        String status = "status_" + index;
        obj.setStatus(status);
    }
    
    public void AccountDataOnDemand.setUpdatedBy(Account obj, int index) {
        String updatedBy = "updatedBy_" + index;
        obj.setUpdatedBy(updatedBy);
    }
    
    public void AccountDataOnDemand.setUpdatedDate(Account obj, int index) {
        Date updatedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUpdatedDate(updatedDate);
    }
    
    public void AccountDataOnDemand.setUserRole(Account obj, int index) {
        String userRole = "userRole_" + index;
        obj.setUserRole(userRole);
    }
    
    public void AccountDataOnDemand.setUsername(Account obj, int index) {
        String username = "username_" + index;
        obj.setUsername(username);
    }
    
    public Account AccountDataOnDemand.getSpecificAccount(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Account obj = data.get(index);
        Long id = obj.getId();
        return Account.findAccount(id);
    }
    
    public Account AccountDataOnDemand.getRandomAccount() {
        init();
        Account obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Account.findAccount(id);
    }
    
    public boolean AccountDataOnDemand.modifyAccount(Account obj) {
        return false;
    }
    
    public void AccountDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Account.findAccountEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Account' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Account>();
        for (int i = 0; i < 10; i++) {
            Account obj = getNewTransientAccount(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
