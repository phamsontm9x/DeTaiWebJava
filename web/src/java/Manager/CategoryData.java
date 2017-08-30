/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.Category;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import Helper.HibernateUtil;

/**
 *
 * @author hhumo
 */
public class CategoryData {

    public ArrayList<Category> getAllcategory() {

        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("from Category");
        ArrayList<Category> list = (ArrayList<Category>) query.list();
        transaction.commit();
        return list;
    }
    
    public static void main(String[] args) {
        System.out.println(new CategoryData().getAllcategory().size());
    }
}
