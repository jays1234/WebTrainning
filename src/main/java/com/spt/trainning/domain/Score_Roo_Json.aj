// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.trainning.domain;

import com.spt.trainning.domain.Score;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Score_Roo_Json {
    
    public String Score.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Score.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Score Score.fromJsonToScore(String json) {
        return new JSONDeserializer<Score>()
        .use(null, Score.class).deserialize(json);
    }
    
    public static String Score.toJsonArray(Collection<Score> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Score.toJsonArray(Collection<Score> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Score> Score.fromJsonArrayToScores(String json) {
        return new JSONDeserializer<List<Score>>()
        .use("values", Score.class).deserialize(json);
    }
    
}