package org.framework.core.common.dao.impl;

import com.amazon.system.system.bootstrap.hibernate.CriteriaQuery;
import com.amazon.system.system.bootstrap.hibernate.SortDirection;
import com.amazon.system.system.bootstrap.json.DataGrid;
import com.amazon.system.system.bootstrap.json.DataGridReturn;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.framework.core.common.dao.BaseDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by User on 2017/6/5.
 */
@Repository("baseDao")
public class BaseDaoImpl implements BaseDao {

    private static Logger logger = LogManager.getLogger(BaseDaoImpl.class.getName());

    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public Session getSession() {
        // 事务必须是开启的(Required)，否则获取不到
        return sessionFactory.getCurrentSession();
    }

    public <T> Serializable save(T entity) {
        try {
            Serializable id = getSession().save(entity);
            if (logger.isDebugEnabled()) {
                logger.debug("保存实体成功," + entity.getClass().getName());
            }
            return id;
        } catch (RuntimeException e) {
            logger.error("保存实体异常", e.fillInStackTrace());
            throw e;
        }
    }

    /**
     * 根据传入的实体添加或更新对象
     *
     * @param <T>
     * @param entity
     */

    public <T> void saveOrUpdate(T entity) {
        try {
            getSession().saveOrUpdate(entity);
            getSession().flush();
            if (logger.isDebugEnabled()) {
                logger.debug("添加或更新成功," + entity.getClass().getName());
            }
        } catch (RuntimeException e) {
            logger.error("添加或更新异常", e.fillInStackTrace());
            throw e;
        }
    }

    /**
     * 根据传入的实体删除对象
     */
    public <T> void delete(T entity) {
        try {
            getSession().delete(entity);
            getSession().flush();
            if (logger.isDebugEnabled()) {
                logger.debug("删除成功," + entity.getClass().getName());
            }
        } catch (RuntimeException e) {
            logger.error("删除异常", e);
            throw e;
        }
    }

    /**
     * 根据Id获取对象。
     */
    public <T> T find(Class<T> entityClass, final Serializable id) {
        return (T) getSession().get(entityClass, id);
    }

    public <T> void deleteEntityById(Class entityName, Serializable id) {
        delete(find(entityName, id));
        getSession().flush();
    }

    /**
     * 根据CriteriaQuery获取List
     *
     * @param cq
     * @return
     */
    @SuppressWarnings("unchecked")
    public List getListByCriteriaQuery(DetachedCriteria cq) {
        Criteria criteria = cq.getExecutableCriteria(getSession());
        return criteria.list();
    }

    public DataGridReturn getDataGridReturn(CriteriaQuery criteriaQuery) {
        Criteria criteria = criteriaQuery.getDetachedCriteria().getExecutableCriteria(getSession());
        final int allCounts = ((Long) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
        DataGrid dataGrid = criteriaQuery.getDataGrid();
        criteria.setProjection(null);
        criteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
        //排序
        if (SortDirection.asc.equals(dataGrid.getOrder())) {
            criteria.addOrder(Order.asc(dataGrid.getSort()));
        } else {
            criteria.addOrder(Order.desc(dataGrid.getSort()));
        }
        criteria.setFirstResult(dataGrid.getOffset());
        criteria.setMaxResults(dataGrid.getLimit());
        List list = criteria.list();
        return new DataGridReturn(allCounts, list);
    }

    public Integer getRowCount(DetachedCriteria detachedCriteria) {
        Criteria criteria = detachedCriteria.getExecutableCriteria(getSession());
        final int allCounts = ((Long) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
        return allCounts;
    }

    public Integer getRowSum(DetachedCriteria detachedCriteria) {
        Criteria criteria = detachedCriteria.getExecutableCriteria(getSession());
        if (criteria.uniqueResult() != null) {
            return ((Long)(criteria.uniqueResult())).intValue();
        }
        return 0;
    }

    public BigDecimal getRowBigDecimalSum(DetachedCriteria detachedCriteria) {
        Criteria criteria = detachedCriteria.getExecutableCriteria(getSession());
        if (criteria.uniqueResult() != null) {
            return ((BigDecimal)(criteria.uniqueResult()));
        }
        return new BigDecimal(0.00);
    }

    public Long getSum(DetachedCriteria detachedCriteria) {
        Criteria criteria = detachedCriteria.getExecutableCriteria(getSession());
        if (criteria.uniqueResult() != null) {
            return (Long)(criteria.uniqueResult());
        }
        return 0L;
    }
}
