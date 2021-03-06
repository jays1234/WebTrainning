// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.trainning.domain;

import com.spt.trainning.domain.Examination;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Examination_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Examination.fieldNames4OrderClauseFilter = java.util.Arrays.asList("topic", "description", "rate", "testCase", "score");
    
    public static long Examination.countExaminations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Examination o", Long.class).getSingleResult();
    }
    
    public static List<Examination> Examination.findAllExaminations() {
        return entityManager().createQuery("SELECT o FROM Examination o", Examination.class).getResultList();
    }
    
    public static List<Examination> Examination.findAllExaminations(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Examination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Examination.class).getResultList();
    }
    
    public static Examination Examination.findExamination(Long id) {
        if (id == null) return null;
        return entityManager().find(Examination.class, id);
    }
    
    public static List<Examination> Examination.findExaminationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Examination o", Examination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Examination> Examination.findExaminationEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Examination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Examination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Examination Examination.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Examination merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
