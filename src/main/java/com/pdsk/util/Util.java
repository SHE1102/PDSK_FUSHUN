package com.pdsk.util;

import com.pdsk.domain.StationTobrows;

public class Util {
	
	public StationTobrows UtilStationTobrows(StationTobrows st0, StationTobrows st1){

		StationTobrows  stat = new StationTobrows();
		stat.setOriginal_SDz(st0.getOriginal_SDz()- st1.getOriginal_SDz());
		stat.setOriginal_SKY(st0.getOriginal_SKY()- st1.getOriginal_SKY());
		stat.setOriginal_SKx(st0.getOriginal_SKx()- st1.getOriginal_SKx());
		
		stat.setSDhAccChange(st0.getsDhAccChange()-st1.getsDhAccChange());
		stat.setSKyAccChange(st0.getsKyAccChange()-st1.getsKyAccChange());
		stat.setSKxAccChange(st0.getsKxAccChange()-st1.getsKxAccChange());
		
		stat.setsDhSingleChange((st0.getsDhSingleChange())-(st1.getsDhSingleChange()));
		stat.setsKxSingleChange(st0.getsKxSingleChange()-st1.getsKxSingleChange());
		stat.setsKySingleChange(st0.getsKySingleChange()-st0.getsKySingleChange());
		
		stat.setName(st0.getName());
		stat.setRecordTime(st1.getRecordTime());
		return stat;
		
	}

}
