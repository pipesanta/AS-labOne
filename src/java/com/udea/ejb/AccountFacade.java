/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.ejb;

import com.udea.entity.Account;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;



/**
 *
 * @author USER
 */
@Stateless
public class AccountFacade extends AbstractFacade<Account> implements AccountFacadeLocal {

    @PersistenceContext(unitName = "CuentasWebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountFacade() {
        super(Account.class);
    }

    @Override
    public Boolean checkLogin(String u, String p) {
        System.out.println("LOGIN WITH: " + u + " - "+ p );
        Query q = em.createQuery("select a from Account a " + "where a.username=:u and a.password=:p");
        //Query q = em.createQuery("SELECT * FROM ROOT.ACCOUNT a WHERE a.USERNAME='las' AND a.PASSWORD='123' ");
        
        q.setParameter("u",u);
        q.setParameter("p",p);
        return q.getResultList().size()>0;
    }

    @Override
    public Account findByUserName(String username) {
        return null;
    }
    
}
