// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.trainning.domain;

import com.spt.trainning.domain.Score;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Score_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Score.fieldNames4OrderClauseFilter = java.util.Arrays.asList("account", "examination", "score");
    
    public static long Score.countScores() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Score o", Long.class).getSingleResult();
    }
    
    public static List<Score> Score.findAllScores() {
        return entityManager().createQuery("SELECT o FROM Score o", Score.class).getResultList();
    }
    
    public static List<Score> Score.findAllScores(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Score o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Score.class).getResultList();
    }
    
    public static Score Score.findScore(Long id) {
        if (id == null) return null;
        return entityManager().find(Score.class, id);
    }
    
    public static List<Score> Score.findScoreEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Score o", Score.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Score> Score.findScoreEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Score o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Score.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Score Score.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Score merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
