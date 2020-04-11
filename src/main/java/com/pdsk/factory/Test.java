package com.pdsk.factory;

/**
 * Created by Administrator on 2020/2/14 0014.
 */
public class Test {

    public void ss(){
        String index = "2";

        int x,y,h;
        x=1;
        y=2;
        h=3;

        String sql = "select COUNT(*) from changedata ch, data_original doc\n" +
                "        where ch.RecordTime between #{timeStart} and #{timeEnd} and doc.`name`=#{nameone} and ch.PairName=#{pairName}";

        if(index == "2"){
            sql += "and (";
            if (x == 1)
                sql += "ch.SKxSingleChange > #{num}";

            if (y == 2)
                sql += "and ch.SKySingleChange > #{num}";
            if (h == 3)
                sql += "and ch.SDhSingleChange > #{num}";

            sql += "or";

            if (x == 1)
                sql += "ch.SKxSingleChange < #{num}";
            if (y == 2)
                sql += "ch.SKySingleChange < #{num}";
            if (h == 3)
                sql += "ch.SDhSingleChange < #{num}";

            sql += ")";
        }

        System.out.println("==============================");
        System.out.println(sql);
    }
}
