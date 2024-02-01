package com.example;

import org.apache.flink.api.java.ExecutionEnvironment;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.api.java.DataSet;

public class Main {
    public static void main(String[] args) throws Exception {
        final ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();
        
        DataSet<Tuple2<String, Integer>> wordCounts = WordCount.executeWordCount(env);
        wordCounts.print();
    }
}
