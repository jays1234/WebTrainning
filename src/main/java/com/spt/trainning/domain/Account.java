package com.spt.trainning.domain;
import com.spt.trainning.base.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "TABLE_PER_CLASS")
@RooJson(deepSerialize = true)
public class Account extends Entity {

    /**
     */
    @NotNull
    @Column(unique = true)
    private String code;

    /**
     */
    @NotNull
    @Column(unique = true)
    private String username;

    /**
     */
    @NotNull
    private String password;

    /**
     */
    @NotNull
    private String userRole;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "account")
    private Set<Score> score = new HashSet<Score>();
}
