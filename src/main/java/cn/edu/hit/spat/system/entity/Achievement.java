package cn.edu.hit.spat.system.entity;

import lombok.Data;

@Data
public class Achievement {
    private Long salesId;
    private Long salesQuantity;
    private Long salesVolume;

    public Long getId(){ return salesId; }
}
